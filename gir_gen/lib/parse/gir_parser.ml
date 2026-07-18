(* GIR XML Parser using xmlm *)

open StdLabels
open Types
module StringSet = Set.Make (String)

(* Accumulator for folding the children of a <class> or <interface>
   element. [cc_methods] and [cc_virtual_methods] are kept separate so
   [merge_methods] can dedupe at the end; [cc_implements] is used by <class>
   and [cc_prerequisites] by <interface>. *)
type class_contents = {
  cc_constructors : gir_constructor list;
  cc_methods : gir_method list;
  cc_virtual_methods : gir_method list;
  cc_properties : gir_property list;
  cc_signals : gir_signal list;
  cc_implements : string list;
  cc_prerequisites : string list;
}

(* [or_none o ~f] keeps [o] when it is [Some _], else falls back to [f ()].
   Lets a chain of "try this lookup, else the next" read as a pipeline instead of
   nested [match]s. *)
let or_none ~f = function
  | Some _ as x -> x
  | None -> f ()

(* Get attribute value from XML attributes list *)
let get_attr name attrs =
  let glib_ns = "http://www.gtk.org/introspection/glib/1.0" in
  (* Try the default namespace, then c: (strip the "c:" prefix, when [name] is
     long enough), then glib: (strip everything up to and including ":"). *)
  List.assoc_opt ("", name) attrs
  |> or_none ~f:(fun () ->
         if String.length name >= 2 then
           List.assoc_opt
             ( "http://www.gtk.org/introspection/c/1.0",
               String.sub ~pos:2 ~len:(String.length name - 2) name )
             attrs
         else None)
  |> or_none ~f:(fun () ->
         let glib_name =
           match String.index_opt name ':' with
           | Some idx ->
               String.sub ~pos:(idx + 1)
                 ~len:(String.length name - idx - 1) name
           | None -> name
         in
         List.assoc_opt (glib_ns, glib_name) attrs)

let ns namespace =
  match namespace with
  | "glib" -> Some "http://www.gtk.org/introspection/glib/1.0"
  | "gtk" -> Some "http://www.gtk.org/introspection/c/1.0"
  | _ -> None

(* Common helper: extract local name from potentially namespaced tag *)
let local_name tag =
  match String.index_opt tag ':' with
  | Some idx -> String.sub ~pos:(idx + 1) ~len:(String.length tag - idx - 1) tag
  | None -> tag

(* Common helper: skip to end of current element *)
let rec skip_element input depth =
  if depth = 0 then ()
  else
    match Xmlm.input input with
    | `El_start _ -> skip_element input (depth + 1)
    | `El_end -> skip_element input (depth - 1)
    | `Data _ -> skip_element input depth
    | `Dtd _ -> skip_element input depth

(* Common helper: extract text data from element *)
let rec element_data input ?(str = None) () =
  match Xmlm.input input with
  | `Data s ->
      element_data input ~str:(Some (Option.value str ~default:"" ^ s)) ()
  | `El_end -> str
  | `El_start _ | `Dtd _ -> failwith "unwanted element inside data element"

(* Common helper: extract text content from a <doc> element, skipping nested
   XML elements (e.g. <link>, <code>) rather than failing on them. This is
   more robust than element_data for doc strings, which can contain markup. *)
let rec parse_doc_text input ?(text = "") () =
  match Xmlm.input input with
  | `Data s -> parse_doc_text input ~text:(text ^ s) ()
  | `El_end -> if text = "" then None else Some text
  | `El_start _ ->
      skip_element input 1;
      parse_doc_text input ~text ()
  | `Dtd _ -> parse_doc_text input ~text ()

(* Shared: Parse enumeration element. <member> recurses into [fold_element]
   for its <doc>; <function> is dispatched to the optional [parse_functions]
   callback (or skipped when none is supplied, e.g. for external namespaces). *)
let parse_enumeration input ?parse_functions attrs =
  match (get_attr "name" attrs, get_attr "c:type" attrs) with
  | Some name, Some c_type ->
      let init =
        {
          enum_name = name;
          enum_c_type = c_type;
          members = [];
          functions = [];
          enum_doc = None;
          enum_version = get_attr "version" attrs;
          enum_os = None;
        }
      in
      let dispatch = function
        | (_, "member") ->
            Some
              (fun ~attrs acc ->
                match
                  ( get_attr "name" attrs,
                    get_attr "value" attrs,
                    get_attr "c:identifier" attrs )
                with
                | Some member_name, Some value_str, Some c_id ->
                    let value =
                      Option.value ~default:0 (int_of_string_opt value_str)
                    in
                    let member_doc =
                      Gir_xml_fold.fold_element ~input
                        ~dispatch:(function
                          | (_, "doc") ->
                              Some (fun ~attrs:_ _ -> parse_doc_text input ())
                          | _ -> None)
                        ~init:None
                        ()
                    in
                    { acc with members =
                        {
                          member_name;
                          member_value = value;
                          c_identifier = c_id;
                          member_doc;
                          member_version = get_attr "version" attrs;
                          member_os = None;
                        }
                        :: acc.members }
                | _ ->
                    skip_element input 1;
                    acc)
        | (_, "function") ->
            (match parse_functions with
             | Some parse_fn ->
                 Some
                   (fun ~attrs acc ->
                      let function_ = parse_fn input attrs in
                      { acc with functions = function_ :: acc.functions })
             | None -> None)
        | _ -> None
      in
      let result = Gir_xml_fold.fold_element ~input ~dispatch ~init () in
      (* [functions] is intentionally not reversed, matching the original. *)
      Some { result with members = List.rev result.members }
  | _ ->
      skip_element input 1;
      None

(* Shared: Merge concrete and virtual methods, removing duplicates *)
let merge_methods concrete virtuals =
  let is_dup m =
    List.exists
      ~f:(fun (c : gir_method) ->
        c.method_name = m.method_name || c.c_identifier = m.c_identifier)
      concrete
  in
  concrete @ List.filter ~f:(fun m -> not (is_dup m)) virtuals

(* Shared: Parse bitfield element. [Gir_xml_fold.fold_element] owns the
   sibling-advance loop; each <member> handler consumes its child (recursing
   into [fold_element] for the member's <doc>) and prepends to [flags]. The
   list is reversed once at the end. *)
let parse_bitfield input attrs =
  match (get_attr "name" attrs, get_attr "c:type" attrs) with
  | Some name, Some c_type ->
      let init =
        {
          bitfield_name = name;
          bitfield_c_type = c_type;
          flags = [];
          bitfield_doc = None;
          bitfield_version = get_attr "version" attrs;
          bitfield_os = None;
        }
      in
      let dispatch = function
        | (_, "member") ->
            Some
              (fun ~attrs acc ->
                match
                  ( get_attr "name" attrs,
                    get_attr "value" attrs,
                    get_attr "c:identifier" attrs )
                with
                | Some flag_name, Some value_str, Some c_id ->
                    let value =
                      Option.value ~default:0 (int_of_string_opt value_str)
                    in
                    let flag_doc =
                      Gir_xml_fold.fold_element ~input
                        ~dispatch:(function
                          | (_, "doc") ->
                              Some (fun ~attrs:_ _ -> parse_doc_text input ())
                          | _ -> None)
                        ~init:None
                        ()
                    in
                    { acc with flags =
                        {
                          flag_name;
                          flag_value = value;
                          flag_c_identifier = c_id;
                          flag_doc;
                          flag_version = get_attr "version" attrs;
                          flag_os = None;
                        }
                        :: acc.flags }
                | _ ->
                    skip_element input 1;
                    acc)
        | _ -> None
      in
      let result = Gir_xml_fold.fold_element ~input ~dispatch ~init () in
      Some { result with flags = List.rev result.flags }
  | _ ->
      skip_element input 1;
      None

(* Parse constant element. <type> is a leaf (attributes only, body skipped via
   [Gir_xml_fold.leaf]); <doc> is a text leaf read by [parse_doc_text]. *)
let parse_constant input attrs =
  match (get_attr "name" attrs, get_attr "value" attrs, get_attr "c:type" attrs) with
  | Some name, Some value, Some c_type ->
      let init =
        {
          constant_name = name;
          constant_c_type = c_type;
          value;
          value_type =
            {
              name = "void";
              c_type = None;
              nullable = false;
              transfer_ownership = Types.TransferNone;
              array = None;
            };
          constant_doc = None;
          version = get_attr "version" attrs;
          os = None;
          introspectable =
            get_attr "introspectable" attrs |> Utils.parse_bool ~default:true;
        }
      in
      let dispatch = function
        | (_, "type") ->
            Some
              (Gir_xml_fold.leaf ~input
                 (fun ~attrs acc ->
                    let type_name =
                      match get_attr "name" attrs with
                      | Some n -> n
                      | None -> "void"
                    in
                    let c_type_name = get_attr "c:type" attrs in
                    let nullable =
                      get_attr "nullable" attrs |> Utils.parse_bool
                    in
                    { acc with value_type =
                        {
                          name = type_name;
                          c_type = c_type_name;
                          nullable;
                          transfer_ownership = Types.TransferNone;
                          array = None;
                        } }))
        | (_, "doc") ->
            Some
              (fun ~attrs:_ acc ->
                 { acc with constant_doc = parse_doc_text input () })
        | _ -> None
      in
      Some (Gir_xml_fold.fold_element ~input ~dispatch ~init ())
  | _ ->
      skip_element input 1;
      None

(* Parse only enums and bitfields from a GIR file (for external namespaces) *)
let parse_gir_enums_only filename =
  let ic = open_in filename in
  let input = Xmlm.make_input ~ns ~strip:true (`Channel ic) in

  let enums = ref [] in
  let bitfields = ref [] in

  (* Main parsing loop - only look for enums and bitfields. <repository> and
     <namespace> are descended into via a nested [fold_element] so the enums
     and bitfields inside the namespace are found. *)
  let rec dispatch = function
    | (_, "enumeration") ->
        Some
          (fun ~attrs () ->
             match parse_enumeration input attrs with
             | Some enum -> enums := enum :: !enums
             | None -> ())
    | (_, "bitfield") ->
        Some
          (fun ~attrs () ->
             match parse_bitfield input attrs with
             | Some bitfield -> bitfields := bitfield :: !bitfields
             | None -> ())
    | (_, "repository") | (_, "namespace") ->
        Some
          (fun ~attrs:_ () ->
             Gir_xml_fold.fold_element ~input ~dispatch ~init:() ())
    | _ -> None
  in

  Gir_xml_fold.fold_document ~input ~dispatch ~init:() ();
  close_in ic;
  (List.rev !enums, List.rev !bitfields)

(* Parse a full GIR file including classes, interfaces, enums, and bitfields *)
let parse_gir_file filename filter_classes =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

  let controllers = ref [] in
  let interfaces : gir_interface list ref = ref [] in
  let enums = ref [] in
  let bitfields = ref [] in
  let records : gir_record list ref = ref [] in
  let constants = ref [] in
  let namespace : gir_namespace option ref = ref None in
  let repository =
    ref
      {
        repository_c_includes = [];
        repository_includes = [];
        repository_packages = [];
      }
  in

  let normalized_filters =
    List.fold_left filter_classes ~init:StringSet.empty ~f:(fun acc name ->
        StringSet.add
          (Utils.normalize_class_name name |> String.lowercase_ascii)
          acc)
  in
  let should_include_class name =
    if StringSet.is_empty normalized_filters then true
    else
      let normalized =
        Utils.normalize_class_name name |> String.lowercase_ascii
      in
      StringSet.mem normalized normalized_filters
  in

  (* Parse a class element *)
  let rec parse_class attrs =
    match get_attr "name" attrs with
    | Some name when should_include_class name ->
        let c_type =
          match get_attr "c:type" attrs with
          | Some t -> t
          | None ->
              (* Use namespace c:identifier-prefixes, fallback to "Gtk" if not available *)
              let prefix =
                match !namespace with
                | Some ns -> ns.namespace_c_identifier_prefixes
                | None -> "Gtk"
              in
              prefix ^ name
        in
        let parent = get_attr "parent" attrs in
        let introspectable =
          get_attr "introspectable" attrs |> Utils.parse_bool ~default:true
        in
        let init =
          {
            cc_constructors = [];
            cc_methods = [];
            cc_virtual_methods = [];
            cc_properties = [];
            cc_signals = [];
            cc_implements = [];
            cc_prerequisites = [];
          }
        in
        let dispatch = function
          | (_, "implements") ->
              Some
                (Gir_xml_fold.leaf ~input
                   (fun ~attrs acc ->
                      { acc with cc_implements =
                          (match get_attr "name" attrs with
                           | Some n -> n :: acc.cc_implements
                           | None -> acc.cc_implements) }))
          | (_, "constructor") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some ctor_name, Some c_id ->
                       let throws = get_attr "throws" attrs = Some "1" in
                       let ctor_introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let _return_type, params, doc, _, _ = parse_method attrs in
                       { acc with cc_constructors =
                           {
                             ctor_name;
                             c_identifier = c_id;
                             ctor_parameters = params;
                             ctor_doc = doc;
                             throws;
                             ctor_introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.cc_constructors }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "signal") ->
              Some
                (fun ~attrs acc ->
                   match parse_signal attrs with
                   | Some signal ->
                       { acc with cc_signals = signal :: acc.cc_signals }
                   | None -> acc (* already skipped by parse_signal *))
          | (_, "method") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some method_name, Some c_id ->
                       let throws =
                         get_attr "throws" attrs |> Utils.parse_bool
                       in
                       let introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let return_type, params, doc, get_property,
                           set_property =
                         parse_method attrs
                       in
                       { acc with cc_methods =
                           {
                             method_name;
                             c_identifier = c_id;
                             return_type;
                             parameters = params;
                             doc;
                             throws;
                             get_property;
                             set_property;
                             introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.cc_methods }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "virtual-method") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some method_name, Some c_id ->
                       let throws =
                         get_attr "throws" attrs |> Utils.parse_bool
                       in
                       let introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let return_type, params, doc, get_property,
                           set_property =
                         parse_method attrs
                       in
                       { acc with cc_virtual_methods =
                           {
                             method_name;
                             c_identifier = c_id;
                             return_type;
                             parameters = params;
                             doc;
                             throws;
                             get_property;
                             set_property;
                             introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.cc_virtual_methods }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "property") ->
              Some
                (fun ~attrs acc ->
                   match get_attr "name" attrs with
                   | Some prop_name ->
                       let prop = parse_property prop_name attrs in
                       { acc with cc_properties = prop :: acc.cc_properties }
                   | None ->
                       skip_element input 1;
                       acc)
          | _ -> None
        in
        let cc = Gir_xml_fold.fold_element ~input ~dispatch ~init () in
        let methods =
          merge_methods (List.rev cc.cc_methods) (List.rev cc.cc_virtual_methods)
        in
        Some
          {
            class_name = name;
            c_type;
            parent;
            implements = List.rev cc.cc_implements;
            introspectable;
            constructors = List.rev cc.cc_constructors;
            methods;
            properties = List.rev cc.cc_properties;
            signals = List.rev cc.cc_signals;
            class_doc = None;
            version = get_attr "version" attrs;
            os = None;
          }
    | _ ->
        skip_element input 1;
        None
  (* Parse property element *)
  and parse_property prop_name attrs =
    let readable =
      match get_attr "readable" attrs with Some "0" -> false | _ -> true
    in
    let writable =
      match get_attr "writable" attrs with Some "1" -> true | _ -> false
    in
    let construct_only =
      match get_attr "construct-only" attrs with Some "1" -> true | _ -> false
    in
    let property_nullable = get_attr "nullable" attrs |> Utils.parse_bool in
    (* Fold the property's children into its [prop_type]. <type> is a leaf,
       <array> is consumed by [parse_array_type], and <doc> is consumed via
       [element_data] (its text is currently discarded, matching the original
       parser which sets [prop_doc = None]). *)
    let init =
      {
        name = "unknown";
        c_type = None;
        nullable = false;
        transfer_ownership = Types.TransferNone;
        array = None;
      }
    in
    let dispatch = function
      | (_, "type") ->
          Some
            (Gir_xml_fold.leaf ~input
               (fun ~attrs _acc ->
                  let type_name =
                    Option.value ~default:"unknown" (get_attr "name" attrs)
                  in
                  let c_type_name = get_attr "c:type" attrs in
                  let nullable =
                    get_attr "nullable" attrs |> Utils.parse_bool
                    || property_nullable
                  in
                  {
                    name = type_name;
                    c_type = c_type_name;
                    nullable;
                    transfer_ownership = Types.TransferNone;
                    array = None;
                  }))
      | (_, "array") ->
          Some
            (fun ~attrs _acc ->
               let array_info =
                 parse_array_type attrs Types.TransferNone property_nullable
               in
               {
                 name = "array";
                 c_type = get_attr "c:type" attrs;
                 nullable = property_nullable;
                 transfer_ownership = Types.TransferNone;
                 array = array_info;
               })
      | (_, "doc") ->
          Some (fun ~attrs:_ acc -> let _ = element_data input () in acc)
      | _ -> None
    in
    let prop_type = Gir_xml_fold.fold_element ~input ~dispatch ~init () in
    {
      prop_name;
      prop_type;
      readable;
      writable;
      construct_only;
      prop_doc = None;
      version = get_attr "version" attrs;
      version_namespace = None;
      os = None;
    }
  (* Parse method contents to extract return type and parameters. Same
     shape as [parse_signal]: <return-value> via [parse_return_value],
     <parameters> via [parse_parameters], <doc> via [element_data]. *)
  and parse_method tag_attrs =
    let get_property = get_attr "glib:get-property" tag_attrs in
    let set_property = get_attr "glib:set-property" tag_attrs in
    let void_type =
      {
        name = "void";
        c_type = None;
        nullable = false;
        transfer_ownership = Types.TransferNone;
        array = None;
      }
    in
    let dispatch = function
      | (_, "return-value") ->
          Some
            (fun ~attrs (_rt, params, doc) ->
               (parse_return_value attrs, params, doc))
      | (_, "parameters") ->
          Some
            (fun ~attrs:_ (rt, _params, doc) ->
               (rt, parse_parameters (), doc))
      | (_, "doc") ->
          Some
            (fun ~attrs:_ (rt, params, _doc) ->
               (rt, params, element_data input ()))
      | _ -> None
    in
    let (return_type, params, doc) =
      Gir_xml_fold.fold_element ~input ~dispatch ~init:(void_type, [], None)
        ()
    in
    (return_type, List.rev params, doc, get_property, set_property)
  (* Parse glib:signal elements. <return-value> is consumed by
     [parse_return_value], <parameters> by [parse_parameters], and <doc>
     by [element_data]. *)
  and parse_signal attrs =
    match get_attr "name" attrs with
    | Some signal_name ->
        let void_type =
          {
            name = "void";
            c_type = None;
            nullable = false;
            transfer_ownership = Types.TransferNone;
            array = None;
          }
        in
        let dispatch = function
          | (_, "return-value") ->
              Some
                (fun ~attrs (_rt, params, doc) ->
                   (parse_return_value attrs, params, doc))
          | (_, "parameters") ->
              Some
                (fun ~attrs:_ (rt, _params, doc) ->
                   (rt, parse_parameters (), doc))
          | (_, "doc") ->
              Some
                (fun ~attrs:_ (rt, params, _doc) ->
                   (rt, params, element_data input ()))
          | _ -> None
        in
        let (return_type, params, doc) =
          Gir_xml_fold.fold_element ~input ~dispatch ~init:(void_type, [], None)
            ()
        in
        let run_when =
          match get_attr "when" attrs with
          | Some "first" -> Some Types.RunFirst
          | Some "last" -> Some Types.RunLast
          | Some "cleanup" -> Some Types.RunCleanup
          | Some other ->
              failwith
                (Printf.sprintf
                   "Invalid 'when' attribute value on signal '%s': %s"
                   signal_name other)
          | None -> None
        in
        Some
          {
            signal_name;
            return_type;
            sig_parameters = List.rev params;
            doc;
            version = get_attr "version" attrs;
            version_namespace = None;
            os = None;
            run_when;
            action = get_attr "action" attrs |> Utils.parse_bool;
            no_recurse = get_attr "no-recurse" attrs |> Utils.parse_bool;
            no_hooks = get_attr "no-hooks" attrs |> Utils.parse_bool;
          }
    | None ->
        skip_element input 1;
        None
  (* Parse array element *)
  and parse_array_type attrs transfer_ownership_attr nullable_attr =
    let length =
      match get_attr "length" attrs with
      | Some s -> int_of_string_opt s
      | None -> None
    in
    let zero_terminated =
      get_attr "zero-terminated" attrs |> Utils.parse_bool
    in
    let fixed_size =
      match get_attr "fixed-size" attrs with
      | Some s -> int_of_string_opt s
      | None -> None
    in
    let array_name = get_attr "name" attrs in
    (* Parse the element type from the nested <type> child. *)
    let init =
      {
        name = "unknown";
        c_type = None;
        nullable = false;
        transfer_ownership = transfer_ownership_attr;
        array = None;
      }
    in
    let dispatch = function
      | (_, "type") ->
          Some
            (Gir_xml_fold.leaf ~input
               (fun ~attrs _acc ->
                  let type_name =
                    Option.value ~default:"unknown" (get_attr "name" attrs)
                  in
                  let c_type_name = get_attr "c:type" attrs in
                  let nullable =
                    get_attr "nullable" attrs |> Utils.parse_bool
                    || nullable_attr
                  in
                  {
                    name = type_name;
                    c_type = c_type_name;
                    nullable;
                    transfer_ownership = transfer_ownership_attr;
                    array = None;
                  }))
      | _ -> None
    in
    let element_type =
      Gir_xml_fold.fold_element ~input ~dispatch ~init ()
    in
    Some { Types.length; zero_terminated; fixed_size; element_type; array_name }
  (* Parse return value type. <type> is not a leaf here: for non-HashTable
     types a nested <type> child is parsed as the element type and wrapped in
     an array info; GLib.HashTable is skipped (it carries key/value types, not
     an element type). <array> is consumed by [parse_array_type]. *)
  and parse_return_value attrs =
    let nullable_attr = get_attr "nullable" attrs |> Utils.parse_bool in
    let transfer_ownership_attr =
      match get_attr "transfer-ownership" attrs with
      | Some "none" -> Types.TransferNone
      | Some "full" -> Types.TransferFull
      | Some "container" -> Types.TransferContainer
      | Some "floating" -> Types.TransferFloating
      | _ -> Types.TransferNone (* default to none if not specified *)
    in
    let init =
      {
        name = "void";
        c_type = None;
        nullable = nullable_attr;
        transfer_ownership = transfer_ownership_attr;
        array = None;
      }
    in
    let dispatch = function
      | (_, "type") ->
          Some
            (fun ~attrs _acc ->
              let type_name =
                Option.value ~default:"void" (get_attr "name" attrs)
              in
              let c_type_name = get_attr "c:type" attrs in
              let nullable =
                get_attr "nullable" attrs |> Utils.parse_bool
                || nullable_attr
              in
              let is_hash_table = String.equal type_name "GLib.HashTable" in
              (* Parse a nested <type> child as the element type, except for
                 GLib.HashTable which has key/value types, not an element type. *)
              let element_type =
                if is_hash_table then begin
                  skip_element input 1;
                  None
                end
                else
                  Gir_xml_fold.fold_element ~input
                    ~dispatch:(function
                      | (_, "type") ->
                          Some
                            (Gir_xml_fold.leaf ~input
                               (fun ~attrs _ ->
                                  let elem_name =
                                    Option.value ~default:"unknown"
                                      (get_attr "name" attrs)
                                  in
                                  let elem_c_type = get_attr "c:type" attrs in
                                  Some
                                    {
                                      name = elem_name;
                                      c_type = elem_c_type;
                                      nullable = false;
                                      transfer_ownership =
                                        transfer_ownership_attr;
                                      array = None;
                                    }))
                      | _ -> None)
                    ~init:None
                    ()
              in
              {
                name = type_name;
                c_type = c_type_name;
                nullable;
                transfer_ownership = transfer_ownership_attr;
                array =
                  (match element_type with
                   | Some elem_type ->
                       Some
                         {
                           Types.length = None;
                           zero_terminated = false;
                           fixed_size = None;
                           element_type = elem_type;
                           array_name = Some type_name;
                         }
                   | None -> None);
              })
      | (_, "array") ->
          Some
            (fun ~attrs _acc ->
               let array_info =
                 parse_array_type attrs transfer_ownership_attr nullable_attr
               in
               {
                 name = "array";
                 c_type = get_attr "c:type" attrs;
                 nullable = nullable_attr;
                 transfer_ownership = transfer_ownership_attr;
                 array = array_info;
               })
      | _ -> None
    in
    Gir_xml_fold.fold_element ~input ~dispatch ~init ()
  and parse_function attrs =
    let function_name = get_attr "name" attrs in
    let c_identifier = get_attr "c:identifier" attrs in
    let throws = get_attr "throws" attrs |> Utils.parse_bool in
    let introspectable =
      get_attr "introspectable" attrs |> Utils.parse_bool ~default:true
    in
    (* Fold the function's children into (return_type, params, doc).
       <return-value> is a leaf here (only its attributes are read, matching
       the original parser); <parameters> is consumed by [parse_parameters];
       <doc> by [element_data]. *)
    let dispatch = function
      | (_, "return-value") ->
          Some
            (Gir_xml_fold.leaf ~input
               (fun ~attrs (_rt, params, doc) ->
                  let type_name =
                    Option.value ~default:"void" (get_attr "name" attrs)
                  in
                  let c_type_name = get_attr "c:type" attrs in
                  let nullable =
                    get_attr "nullable" attrs |> Utils.parse_bool ~default:false
                  in
                  ( Some
                      {
                        name = type_name;
                        c_type = c_type_name;
                        nullable;
                        transfer_ownership = Types.TransferNone;
                        array = None;
                      },
                    params,
                    doc )))
      | (_, "parameters") ->
          Some
            (fun ~attrs:_ (rt, _params, doc) -> (rt, parse_parameters (), doc))
      | (_, "doc") ->
          Some
            (fun ~attrs:_ (rt, params, _doc) ->
               (rt, params, element_data input ()))
      | _ -> None
    in
    let (return_type, params, doc) =
      Gir_xml_fold.fold_element ~input ~dispatch ~init:(None, [], None) ()
    in
    match (function_name, c_identifier, return_type) with
    | Some function_name, Some c_identifier, Some return_type ->
        {
          function_name;
          c_identifier;
          return_type;
          parameters = List.rev params;
          doc;
          throws;
          introspectable;
          version = get_attr "version" attrs;
          version_namespace = None;
          os = None;
        }
    | _, _, _ -> failwith "Unable to parse function correctly"
  (* Parse parameters list. The outer fold collects <parameter> children
     (skipping <instance-parameter>); each <parameter> handler folds the
     parameter's children into (param_type, varargs). The parameter's own
     attributes are captured as [param_attrs] so the nested <array> handler
     can still read them. The list is returned in reverse order; callers
     [List.rev] it. *)
  and parse_parameters () =
    let dispatch = function
      | (_, "parameter") ->
          Some
            (fun ~attrs acc ->
              let param_attrs = attrs in
              let param_name =
                Option.value ~default:"arg" (get_attr "name" attrs)
              in
              let nullable =
                match get_attr "nullable" attrs with Some "1" -> true
                | _ -> false
              in
              let direction =
                match get_attr "direction" attrs with
                | Some "out" -> Out
                | Some "inout" -> InOut
                | _ -> In
              in
              let caller_allocates =
                get_attr "caller-allocates" attrs |> Utils.parse_bool
              in
              let transfer_ownership =
                match get_attr "transfer-ownership" attrs with
                | Some "none" -> Types.TransferNone
                | Some "full" -> Types.TransferFull
                | Some "container" -> Types.TransferContainer
                | Some "floating" -> Types.TransferFloating
                | _ -> Types.TransferNone
              in
              let init_type =
                {
                  name = "void";
                  c_type = None;
                  nullable = false;
                  transfer_ownership;
                  array = None;
                }
              in
              let param_type, varargs =
                Gir_xml_fold.fold_element ~input
                  ~dispatch:(function
                    | (_, "varargs") ->
                        Some
                          (Gir_xml_fold.leaf ~input
                             (fun ~attrs:_ (t, _) -> (t, true)))
                    | (_, "type") ->
                        Some
                          (fun ~attrs (_t, varargs) ->
                             let type_name =
                               Option.value ~default:"void"
                                 (get_attr "name" attrs)
                             in
                             let c_type_name = get_attr "c:type" attrs in
                             let nullable =
                               get_attr "nullable" attrs |> Utils.parse_bool
                             in
                             let is_hash_table =
                               String.equal type_name "GLib.HashTable"
                             in
                             let element_type =
                               if is_hash_table then begin
                                 skip_element input 1;
                                 None
                               end
                               else
                                 Gir_xml_fold.fold_element ~input
                                   ~dispatch:(function
                                     | (_, "type") ->
                                         Some
                                           (Gir_xml_fold.leaf ~input
                                              (fun ~attrs _ ->
                                                 let elem_name =
                                                   Option.value ~default:"unknown"
                                                     (get_attr "name" attrs)
                                                 in
                                                 let elem_c_type =
                                                   get_attr "c:type" attrs
                                                 in
                                                 Some
                                                   {
                                                     name = elem_name;
                                                     c_type = elem_c_type;
                                                     nullable = false;
                                                     transfer_ownership;
                                                     array = None;
                                                   }))
                                     | _ -> None)
                                   ~init:None
                                   ()
                             in
                             ( {
                                 name = type_name;
                                 c_type = c_type_name;
                                 nullable;
                                 transfer_ownership;
                                 array =
                                   (match element_type with
                                    | Some et ->
                                        Some
                                          {
                                            Types.length = None;
                                            zero_terminated = false;
                                            fixed_size = None;
                                            element_type = et;
                                            array_name = Some type_name;
                                          }
                                    | None -> None);
                               },
                               varargs ))
                    | (_, "array") ->
                        Some
                          (fun ~attrs (_t, varargs) ->
                             let nullable_param =
                               get_attr "nullable" param_attrs
                               |> Utils.parse_bool
                             in
                             let array_info =
                               parse_array_type attrs transfer_ownership
                                 nullable_param
                             in
                             ( {
                                 name = "array";
                                 c_type = get_attr "c:type" attrs;
                                 nullable = nullable_param;
                                 transfer_ownership;
                                 array = array_info;
                               },
                               varargs ))
                    | _ -> None)
                  ~init:(init_type, false)
                  ()
              in
              { param_name; param_type; direction; nullable; varargs;
                caller_allocates }
              :: acc)
      | (_, "instance-parameter") -> None
      | _ -> None
    in
    Gir_xml_fold.fold_element ~input ~dispatch ~init:[] ()
  and parse_repository _ =
    let init =
      { repository_c_includes = []; repository_includes = [];
        repository_packages = [] }
    in
    let dispatch = function
      | ("http://www.gtk.org/introspection/c/1.0", "include") ->
          Some
            (Gir_xml_fold.leaf ~input
               (fun ~attrs acc ->
                  { acc with repository_c_includes =
                      (match get_attr "name" attrs with
                       | Some name -> name :: acc.repository_c_includes
                       | None -> acc.repository_c_includes) }))
      | ("http://www.gtk.org/introspection/core/1.0", "include") ->
          Some
            (Gir_xml_fold.leaf ~input
               (fun ~attrs acc ->
                  { acc with repository_includes =
                      (match (get_attr "name" attrs, get_attr "version" attrs)
                       with
                       | Some name, Some version ->
                           { include_name = name; include_version = version }
                           :: acc.repository_includes
                       | _ -> acc.repository_includes) }))
      | ("http://www.gtk.org/introspection/core/1.0", "package") ->
          Some
            (Gir_xml_fold.leaf ~input
               (fun ~attrs acc ->
                  { acc with repository_packages =
                      (match get_attr "name" attrs with
                       | Some name -> name :: acc.repository_packages
                       | None -> acc.repository_packages) }))
      | _ -> None
    in
    (* Stop before the <namespace> sibling, leaving it for [parse_document]'s
       namespace handler. The lists are returned in reverse order, matching
       the original parser. *)
    Gir_xml_fold.fold_element ~input ~dispatch
      ~stop_on:(function (_, "namespace") -> true | _ -> false)
      ~init ()
  (* Parse a record element *)
  and parse_record attrs =
    match (get_attr "name" attrs, get_attr "c:type" attrs) with
    | Some record_name, Some c_type ->
        let introspectable =
          get_attr "introspectable" attrs |> Utils.parse_bool ~default:true
        in
        (* glib:type-name/get-type are namespaced attributes; the local names
           are "type-name" and "get-type" *)
        let glib_type_name =
          match get_attr "type-name" attrs with
          | Some v -> Some v
          | None -> get_attr "glib:type-name" attrs
        in
        let glib_get_type =
          match get_attr "get-type" attrs with
          | Some v -> Some v
          | None -> get_attr "glib:get-type" attrs
        in
        let is_gtype_struct_for =
          match get_attr "is-gtype-struct-for" attrs with
          | Some v -> Some v
          | None -> get_attr "glib:is-gtype-struct-for" attrs
        in
        let opaque = get_attr "opaque" attrs |> Utils.parse_bool in
        let disguised = get_attr "disguised" attrs |> Utils.parse_bool in
        let c_symbol_prefix = get_attr "c:symbol-prefix" attrs in
        let init =
          {
            record_name;
            c_type;
            glib_type_name;
            glib_get_type;
            opaque;
            disguised;
            introspectable;
            c_symbol_prefix;
            is_gtype_struct_for;
            fields = [];
            constructors = [];
            methods = [];
            functions = [];
            record_doc = None;
            version = get_attr "version" attrs;
            os = None;
          }
        in
        let dispatch = function
          | (_, "field") ->
              Some
                (fun ~attrs acc ->
                  let field_name = get_attr "name" attrs in
                  let readable =
                    get_attr "readable" attrs |> Utils.parse_bool
                  in
                  let writable =
                    get_attr "writable" attrs |> Utils.parse_bool
                  in
                  (* Fold the field's children into (field_type, field_doc).
                     <type> is a leaf; <array> is consumed by [parse_array_type];
                     <doc> by [parse_doc_text]. *)
                  let field_type, field_doc =
                    Gir_xml_fold.fold_element ~input
                      ~dispatch:(function
                        | (_, "type") ->
                            Some
                              (Gir_xml_fold.leaf ~input
                                 (fun ~attrs (_, fdoc) ->
                                    let type_name =
                                      Option.value ~default:"unknown"
                                        (get_attr "name" attrs)
                                    in
                                    let c_type_name = get_attr "c:type" attrs in
                                    let nullable =
                                      get_attr "nullable" attrs
                                      |> Utils.parse_bool
                                    in
                                    ( Some
                                        {
                                          name = type_name;
                                          c_type = c_type_name;
                                          nullable;
                                          transfer_ownership =
                                            Types.TransferNone;
                                          array = None;
                                        },
                                      fdoc )))
                        | (_, "array") ->
                            Some
                              (fun ~attrs (_, fdoc) ->
                                 let array_info =
                                   parse_array_type attrs Types.TransferNone
                                     false
                                 in
                                 ( Some
                                     {
                                       name = "array";
                                       c_type = get_attr "c:type" attrs;
                                       nullable = false;
                                       transfer_ownership =
                                         Types.TransferNone;
                                       array = array_info;
                                     },
                                   fdoc ))
                        | (_, "doc") ->
                            Some
                              (fun ~attrs:_ (ftype, _) ->
                                 (ftype, parse_doc_text input ()))
                        | _ -> None)
                      ~init:(None, None)
                      ()
                  in
                  match field_name with
                  | Some name ->
                      { acc with fields =
                          {
                            field_name = name;
                            field_type;
                            readable;
                            writable;
                            field_doc;
                            field_version = get_attr "version" attrs;
                            field_os = None;
                          }
                          :: acc.fields }
                  | None -> acc)
          | (_, "constructor") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some ctor_name, Some c_id ->
                       let throws = get_attr "throws" attrs = Some "1" in
                       let ctor_introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let _return_type, params, doc, _, _ =
                         parse_method attrs
                       in
                       { acc with constructors =
                           {
                             ctor_name;
                             c_identifier = c_id;
                             ctor_parameters = params;
                             ctor_doc = doc;
                             throws;
                             ctor_introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.constructors }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "method") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some method_name, Some c_id ->
                       let throws =
                         get_attr "throws" attrs |> Utils.parse_bool
                       in
                       let introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let return_type, params, doc, get_property,
                           set_property =
                         parse_method attrs
                       in
                       { acc with methods =
                           {
                             method_name;
                             c_identifier = c_id;
                             return_type;
                             parameters = params;
                             doc;
                             throws;
                             get_property;
                             set_property;
                             introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.methods }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "doc") ->
              Some
                (fun ~attrs:_ acc ->
                   { acc with record_doc = element_data input () })
          | (_, "function") ->
              Some
                (fun ~attrs acc ->
                   let function_ = parse_function attrs in
                   { acc with functions = function_ :: acc.functions })
          | _ -> None
        in
        let result = Gir_xml_fold.fold_element ~input ~dispatch ~init () in
        (* [functions] is intentionally not reversed here, matching the
           original parser's behaviour; fields/constructors/methods are. *)
        Some
          { result with
            fields = List.rev result.fields;
            constructors = List.rev result.constructors;
            methods = List.rev result.methods;
          }
    | _ ->
        skip_element input 1;
        None
  and parse_interface attrs () =
    match get_attr "name" attrs with
    | None ->
        skip_element input 1;
        None
    | Some name ->
        let c_type =
          match get_attr "c:type" attrs with
          | Some t -> t
          | None ->
              (* Use namespace c:identifier-prefixes, fallback to "Gtk" if not available *)
              let prefix =
                match !namespace with
                | Some ns -> ns.namespace_c_identifier_prefixes
                | None -> "Gtk"
              in
              prefix ^ name
        in
        let introspectable =
          get_attr "introspectable" attrs |> Utils.parse_bool ~default:true
        in
        let init =
          {
            cc_constructors = [];
            cc_methods = [];
            cc_virtual_methods = [];
            cc_properties = [];
            cc_signals = [];
            cc_implements = [];
            cc_prerequisites = [];
          }
        in
        let dispatch = function
          | (_, "signal") ->
              Some
                (fun ~attrs acc ->
                   match parse_signal attrs with
                   | Some signal ->
                       { acc with cc_signals = signal :: acc.cc_signals }
                   | None -> acc (* already skipped by parse_signal *))
          | (_, "method") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some method_name, Some c_id ->
                       let throws =
                         get_attr "throws" attrs |> Utils.parse_bool
                       in
                       let introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let return_type, params, doc, get_property,
                           set_property =
                         parse_method attrs
                       in
                       { acc with cc_methods =
                           {
                             method_name;
                             c_identifier = c_id;
                             return_type;
                             parameters = params;
                             doc;
                             throws;
                             get_property;
                             set_property;
                             introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.cc_methods }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "virtual-method") ->
              Some
                (fun ~attrs acc ->
                   match
                     (get_attr "name" attrs, get_attr "c:identifier" attrs)
                   with
                   | Some method_name, Some c_id ->
                       let throws =
                         get_attr "throws" attrs |> Utils.parse_bool
                       in
                       let introspectable =
                         get_attr "introspectable" attrs
                         |> Utils.parse_bool ~default:true
                       in
                       let return_type, params, doc, get_property,
                           set_property =
                         parse_method attrs
                       in
                       { acc with cc_virtual_methods =
                           {
                             method_name;
                             c_identifier = c_id;
                             return_type;
                             parameters = params;
                             doc;
                             throws;
                             get_property;
                             set_property;
                             introspectable;
                             version = get_attr "version" attrs;
                             version_namespace = None;
                             os = None;
                           }
                           :: acc.cc_virtual_methods }
                   | _ ->
                       skip_element input 1;
                       acc)
          | (_, "property") ->
              Some
                (fun ~attrs acc ->
                   match get_attr "name" attrs with
                   | Some prop_name ->
                       let prop = parse_property prop_name attrs in
                       { acc with cc_properties = prop :: acc.cc_properties }
                   | None ->
                       skip_element input 1;
                       acc)
          | (_, "prerequisite") ->
              Some
                (Gir_xml_fold.leaf ~input
                   (fun ~attrs acc ->
                      { acc with cc_prerequisites =
                          (match get_attr "name" attrs with
                           | Some n -> n :: acc.cc_prerequisites
                           | None -> acc.cc_prerequisites) }))
          | _ -> None
        in
        let cc = Gir_xml_fold.fold_element ~input ~dispatch ~init () in
        let methods =
          merge_methods (List.rev cc.cc_methods) (List.rev cc.cc_virtual_methods)
        in
        Some
          {
            interface_name = name;
            c_type;
            c_symbol_prefix =
              (match get_attr "c:symbol-prefix" attrs with
              | Some p -> p
              | None -> String.lowercase_ascii name);
            glib_type_name = get_attr "glib:type-name" attrs;
            glib_get_type = get_attr "glib:get-type" attrs;
            prerequisites = List.rev cc.cc_prerequisites;
            introspectable;
            methods;
            properties = List.rev cc.cc_properties;
            signals = List.rev cc.cc_signals;
            interface_doc = None;
            version = get_attr "version" attrs;
            os = None;
          }
  in

  (* Main parsing loop: fold the top-level element sequence until end-of-input.
     <repository> is consumed by [parse_repository] (which stops before the
     <namespace>); the <namespace> handler records the namespace and then
     consumes it by folding its children with the same [dispatch], so the
     class/interface/... entities inside it are parsed here rather than
     leaked to the top level. *)
  let rec dispatch = function
    | (_, "class") ->
        Some
          (fun ~attrs () ->
             match parse_class attrs with
             | Some cls -> controllers := cls :: !controllers
             | None -> ())
    | (_, "interface") ->
        Some
          (fun ~attrs () ->
             match parse_interface attrs () with
             | Some cls -> interfaces := cls :: !interfaces
             | None -> ())
    | (_, "enumeration") ->
        Some
          (fun ~attrs () ->
             match
               parse_enumeration input ~parse_functions:(fun _ -> parse_function)
                 attrs
             with
             | Some enum -> enums := enum :: !enums
             | None -> ())
    | (_, "bitfield") ->
        Some
          (fun ~attrs () ->
             match parse_bitfield input attrs with
             | Some bitfield -> bitfields := bitfield :: !bitfields
             | None -> ())
    | (_, "record") ->
        Some
          (fun ~attrs () ->
             match parse_record attrs with
             | Some record -> records := record :: !records
             | None -> ())
    | (_, "constant") ->
        Some
          (fun ~attrs () ->
             match parse_constant input attrs with
             | Some constant -> constants := constant :: !constants
             | None -> ())
    | (_, "namespace") ->
        Some
          (fun ~attrs () ->
             (match
                ( get_attr "name" attrs,
                  get_attr "version" attrs,
                  get_attr "shared-library" attrs,
                  get_attr "c:identifier-prefixes" attrs,
                  get_attr "c:symbol-prefixes" attrs )
              with
              | Some name, Some version, Some shared_library,
                Some c_id_prefixes, Some c_sym_prefixes ->
                  namespace :=
                    Some
                      {
                        namespace_name = name;
                        namespace_version = version;
                        namespace_shared_library = shared_library;
                        namespace_c_identifier_prefixes = c_id_prefixes;
                        namespace_c_symbol_prefixes = c_sym_prefixes;
                      }
              | _ ->
                  (* A well-formed GIR <repository> always carries one
                     <namespace> with all five attributes; if any is missing
                     the file is malformed and there is nothing useful to
                     generate. *)
                  failwith
                    "gir_parser: <namespace> missing one of name, version, shared-library, c:identifier-prefixes, c:symbol-prefixes");
             (* Consume the namespace by folding its children with the same
                dispatch, so class/interface/... inside it are parsed here. *)
             Gir_xml_fold.fold_element ~input ~dispatch ~init:() ())
    | (_, "repository") ->
        Some (fun ~attrs () -> repository := parse_repository attrs)
    | _ -> None
  in

  Gir_xml_fold.fold_document ~input ~dispatch ~init:() ();
  close_in ic;

  ( !repository,
    (match !namespace with
     | Some ns -> ns
     | None -> failwith "Unable to parse namespace correctly"),
    List.rev !controllers,
    List.rev !interfaces,
    List.rev !enums,
    List.rev !bitfields,
    List.rev !records,
    List.rev !constants )
