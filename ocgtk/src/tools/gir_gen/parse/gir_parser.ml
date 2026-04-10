(* GIR XML Parser using xmlm *)

open StdLabels
open Types
module StringSet = Set.Make (String)

(* Get attribute value from XML attributes list *)
let get_attr name attrs =
  let glib_ns = "http://www.gtk.org/introspection/glib/1.0" in
  try List.assoc ("", name) attrs |> fun x -> Some x
  with Not_found -> (
    (* Try with c: namespace *)
    try
      List.assoc
        ( "http://www.gtk.org/introspection/c/1.0",
          String.sub ~pos:2 ~len:(String.length name - 2) name )
        attrs
      |> fun x -> Some x
    with Not_found -> (
      (* Try with glib: namespace (used by signals) *)
      try
        let glib_name =
          match String.index_opt name ':' with
          | Some idx ->
              String.sub ~pos:(idx + 1) ~len:(String.length name - idx - 1) name
          | None -> name
        in
        List.assoc (glib_ns, glib_name) attrs |> fun x -> Some x
      with Not_found -> None))

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

(* Shared: Parse enumeration element *)
let parse_enumeration input ?parse_functions attrs =
  match (get_attr "name" attrs, get_attr "c:type" attrs) with
  | Some name, Some c_type ->
      begin
        let members = ref [] in
        let functions = ref [] in

        let rec parse_enum_contents () =
          match Xmlm.input input with
          | `El_start ((_, tag), member_attrs) when local_name tag = "member"
            -> (
              match
                ( get_attr "name" member_attrs,
                  get_attr "value" member_attrs,
                  get_attr "c:identifier" member_attrs )
              with
              | Some member_name, Some value_str, Some c_id ->
                  let value = try int_of_string value_str with _ -> 0 in
                  let member_doc = ref None in
                  let rec parse_member_contents () =
                    match Xmlm.input input with
                    | `El_start ((_, tag), _) when local_name tag = "doc" ->
                        member_doc := parse_doc_text input ();
                        parse_member_contents ()
                    | `El_start _ ->
                        skip_element input 1;
                        parse_member_contents ()
                    | `El_end -> ()
                    | `Data _ | `Dtd _ -> parse_member_contents ()
                  in
                  parse_member_contents ();
                  members :=
                    {
                      member_name;
                      member_value = value;
                      c_identifier = c_id;
                      member_doc = !member_doc;
                      member_version = get_attr "version" member_attrs;
                    }
                    :: !members;
                  parse_enum_contents ()
              | _ ->
                  skip_element input 1;
                  parse_enum_contents ())
          | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "function"
            -> (
              match parse_functions with
              | Some parse_fn ->
                  let function_ = parse_fn input attrs in
                  functions := function_ :: !functions;
                  parse_enum_contents ()
              | None ->
                  skip_element input 1;
                  parse_enum_contents ())
          | `El_start _ ->
              skip_element input 1;
              parse_enum_contents ()
          | `El_end -> ()
          | `Data _ -> parse_enum_contents ()
          | `Dtd _ -> parse_enum_contents ()
        in

        parse_enum_contents ();
        Some
          {
            enum_name = name;
            enum_c_type = c_type;
            members = List.rev !members;
            enum_doc = None;
            functions = !functions;
            enum_version = get_attr "version" attrs;
          }
      end
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

(* Shared: Parse bitfield element *)
let parse_bitfield input attrs =
  match (get_attr "name" attrs, get_attr "c:type" attrs) with
  | Some name, Some c_type ->
      begin
        let flags = ref [] in

        let rec parse_bitfield_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) -> (
              match
                ( get_attr "name" member_attrs,
                  get_attr "value" member_attrs,
                  get_attr "c:identifier" member_attrs )
              with
              | Some flag_name, Some value_str, Some c_id ->
                  let value = try int_of_string value_str with _ -> 0 in
                  let flag_doc = ref None in
                  let rec parse_flag_contents () =
                    match Xmlm.input input with
                    | `El_start ((_, tag), _) when local_name tag = "doc" ->
                        flag_doc := parse_doc_text input ();
                        parse_flag_contents ()
                    | `El_start _ ->
                        skip_element input 1;
                        parse_flag_contents ()
                    | `El_end -> ()
                    | `Data _ | `Dtd _ -> parse_flag_contents ()
                  in
                  parse_flag_contents ();
                  flags :=
                    {
                      flag_name;
                      flag_value = value;
                      flag_c_identifier = c_id;
                      flag_doc = !flag_doc;
                      flag_version = get_attr "version" member_attrs;
                    }
                    :: !flags;
                  parse_bitfield_contents ()
              | _ ->
                  skip_element input 1;
                  parse_bitfield_contents ())
          | `El_start _ ->
              skip_element input 1;
              parse_bitfield_contents ()
          | `El_end -> ()
          | `Data _ -> parse_bitfield_contents ()
          | `Dtd _ -> parse_bitfield_contents ()
        in

        parse_bitfield_contents ();
        Some
          {
            bitfield_name = name;
            bitfield_c_type = c_type;
            flags = List.rev !flags;
            bitfield_doc = None;
            bitfield_version = get_attr "version" attrs;
          }
      end
  | _ ->
      skip_element input 1;
      None

(* Parse only enums and bitfields from a GIR file (for external namespaces) *)
let parse_gir_enums_only filename =
  let ic = open_in filename in
  let input = Xmlm.make_input ~ns ~strip:true (`Channel ic) in

  let enums = ref [] in
  let bitfields = ref [] in

  (* Main parsing loop - only look for enums and bitfields *)
  let rec parse_document () =
    if Xmlm.eoi input then ()
    else
      match Xmlm.input input with
      | `El_start ((_, tag), attrs) when local_name tag = "enumeration" ->
          (match parse_enumeration input attrs with
          | Some enum -> enums := enum :: !enums
          | None -> ());
          parse_document ()
      | `El_start ((_, tag), attrs) when local_name tag = "bitfield" ->
          (match parse_bitfield input attrs with
          | Some bitfield -> bitfields := bitfield :: !bitfields
          | None -> ());
          parse_document ()
      | `El_start ((_, tag), _) when tag = "repository" || tag = "namespace" ->
          parse_document ()
      | `El_start _ ->
          skip_element input 1;
          parse_document ()
      | `El_end -> parse_document ()
      | `Data _ -> parse_document ()
      | `Dtd _ -> parse_document ()
  in

  parse_document ();
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
        let constructors = ref [] in
        let methods = ref [] in
        let virtual_methods = ref [] in
        let properties = ref [] in
        let signals = ref [] in

        let rec parse_class_contents () =
          match Xmlm.input input with
          | `El_start ((_, raw_tag), tag_attrs) -> (
              let tag = local_name raw_tag in
              match tag with
              | "constructor" -> (
                  match
                    ( get_attr "name" tag_attrs,
                      get_attr "c:identifier" tag_attrs )
                  with
                  | Some ctor_name, Some c_id ->
                      let throws = get_attr "throws" tag_attrs = Some "1" in
                      let ctor_introspectable =
                        get_attr "introspectable" tag_attrs
                        |> Utils.parse_bool ~default:true
                      in
                      let _return_type, params, doc, _, _ =
                        parse_method tag_attrs
                      in
                      constructors :=
                        {
                          ctor_name;
                          c_identifier = c_id;
                          ctor_parameters = params;
                          ctor_doc = doc;
                          throws;
                          ctor_introspectable;
                          version = get_attr "version" tag_attrs;
                          version_namespace = None;
                        }
                        :: !constructors;
                      parse_class_contents ()
                  | _ ->
                      skip_element input 1;
                      parse_class_contents ())
              | "signal" -> (
                  match parse_signal tag_attrs with
                  | Some signal ->
                      signals := signal :: !signals;
                      parse_class_contents ()
                  | None ->
                      skip_element input 1;
                      parse_class_contents ())
              | "method" -> (
                  match
                    ( get_attr "name" tag_attrs,
                      get_attr "c:identifier" tag_attrs )
                  with
                  | Some method_name, Some c_id ->
                      let throws =
                        get_attr "throws" tag_attrs |> Utils.parse_bool
                      in
                      let introspectable =
                        get_attr "introspectable" tag_attrs
                        |> Utils.parse_bool ~default:true
                      in
                      let return_type, params, doc, get_property, set_property =
                        parse_method tag_attrs
                      in
                      methods :=
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
                          version = get_attr "version" tag_attrs;
                          version_namespace = None;
                        }
                        :: !methods;
                      parse_class_contents ()
                  | _ ->
                      skip_element input 1;
                      parse_class_contents ())
              | "virtual-method" -> (
                  match
                    ( get_attr "name" tag_attrs,
                      get_attr "c:identifier" tag_attrs )
                  with
                  | Some method_name, Some c_id ->
                      let throws =
                        get_attr "throws" tag_attrs |> Utils.parse_bool
                      in
                      let introspectable =
                        get_attr "introspectable" tag_attrs
                        |> Utils.parse_bool ~default:true
                      in
                      let return_type, params, doc, get_property, set_property =
                        parse_method tag_attrs
                      in
                      virtual_methods :=
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
                          version = get_attr "version" tag_attrs;
                          version_namespace = None;
                        }
                        :: !virtual_methods;
                      parse_class_contents ()
                  | _ ->
                      skip_element input 1;
                      parse_class_contents ())
              | "property" -> (
                  match get_attr "name" tag_attrs with
                  | Some prop_name ->
                      let prop = parse_property prop_name tag_attrs in
                      properties := prop :: !properties;
                      parse_class_contents ()
                  | None ->
                      skip_element input 1;
                      parse_class_contents ())
              | _ ->
                  skip_element input 1;
                  parse_class_contents ())
          | `El_end -> () (* End of class *)
          | `Data _ -> parse_class_contents ()
          | `Dtd _ -> parse_class_contents ()
        in

        parse_class_contents ();
        let methods =
          merge_methods (List.rev !methods) (List.rev !virtual_methods)
        in
        Some
          {
            class_name = name;
            c_type;
            parent;
            implements = [];
            introspectable;
            constructors = List.rev !constructors;
            methods;
            properties = List.rev !properties;
            signals = List.rev !signals;
            class_doc = None;
            version = get_attr "version" attrs;
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

    (* Parse property type from child element *)
    let prop_type =
      ref
        {
          name = "unknown";
          c_type = None;
          nullable = false;
          transfer_ownership = Types.TransferNone;
          array = None;
        }
    in

    let doc : string option ref = ref None in

    let rec parse_prop_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), type_attrs) ->
          let type_name =
            match get_attr "name" type_attrs with
            | Some n -> n
            | None -> "unknown"
          in
          let c_type_name = get_attr "c:type" type_attrs in
          let nullable =
            get_attr "nullable" type_attrs |> Utils.parse_bool
            || property_nullable
          in
          prop_type :=
            {
              name = type_name;
              c_type = c_type_name;
              nullable;
              transfer_ownership = Types.TransferNone;
              array = None;
            };
          skip_element input 1;
          parse_prop_contents ()
      | `El_start ((_, "array"), array_attrs) ->
          let array_info =
            parse_array_type array_attrs Types.TransferNone property_nullable
          in
          prop_type :=
            {
              name = "array";
              c_type = get_attr "c:type" array_attrs;
              nullable = property_nullable;
              transfer_ownership = Types.TransferNone;
              array = array_info;
            };
          parse_prop_contents ()
      | `El_start ((_, "doc"), _) ->
          doc := element_data input ();
          parse_prop_contents ()
      | `El_start _ ->
          skip_element input 1;
          parse_prop_contents ()
      | `El_end -> ()
      | `Data _ -> parse_prop_contents ()
      | `Dtd _ -> parse_prop_contents ()
    in

    parse_prop_contents ();
    {
      prop_name;
      prop_type = !prop_type;
      readable;
      writable;
      construct_only;
      prop_doc = None;
      version = get_attr "version" attrs;
      version_namespace = None;
    }
  (* Parse method contents to extract return type and parameters *)
  and parse_method tag_attrs =
    let get_property = get_attr "glib:get-property" tag_attrs in
    let set_property = get_attr "glib:set-property" tag_attrs in
    let return_type =
      ref
        {
          name = "void";
          c_type = None;
          nullable = false;
          transfer_ownership = Types.TransferNone;
          array = None;
        }
    in
    let params = ref [] in
    let doc : string option ref = ref None in
    let rec parse_method_contents () =
      match Xmlm.input input with
      | `El_start ((_, tag), _tag_attrs) -> (
          match tag with
          | "return-value" ->
              return_type := parse_return_value _tag_attrs;
              parse_method_contents ()
          | "parameters" ->
              params := parse_parameters ();
              parse_method_contents ()
          | "doc" ->
              doc := element_data input ();
              parse_method_contents ()
          | _ ->
              skip_element input 1;
              parse_method_contents ())
      | `El_end -> ()
      | `Data _ -> parse_method_contents ()
      | `Dtd _ -> parse_method_contents ()
    in

    parse_method_contents ();
    (!return_type, List.rev !params, !doc, get_property, set_property)
  (* Parse glib:signal elements *)
  and parse_signal attrs =
    match get_attr "name" attrs with
    | Some signal_name ->
        let return_type =
          ref
            {
              name = "void";
              c_type = None;
              nullable = false;
              transfer_ownership = Types.TransferNone;
              array = None;
            }
        in
        let params = ref [] in
        let doc : string option ref = ref None in

        let rec parse_signal_contents () =
          match Xmlm.input input with
          | `El_start ((_, raw_tag), tag_attrs) -> (
              let tag = local_name raw_tag in
              match tag with
              | "return-value" ->
                  return_type := parse_return_value tag_attrs;
                  parse_signal_contents ()
              | "parameters" ->
                  params := parse_parameters ();
                  parse_signal_contents ()
              | "doc" ->
                  doc := element_data input ();
                  parse_signal_contents ()
              | _ ->
                  skip_element input 1;
                  parse_signal_contents ())
          | `El_end -> ()
          | `Data _ -> parse_signal_contents ()
          | `Dtd _ -> parse_signal_contents ()
        in

        parse_signal_contents ();
        Some
          {
            signal_name;
            return_type = !return_type;
            sig_parameters = List.rev !params;
            doc = !doc;
            version = get_attr "version" attrs;
            version_namespace = None;
          }
    | None ->
        skip_element input 1;
        None
  (* Parse array element *)
  and parse_array_type attrs transfer_ownership_attr nullable_attr =
    let length =
      match get_attr "length" attrs with
      | Some s -> ( try Some (int_of_string s) with _ -> None)
      | None -> None
    in
    let zero_terminated =
      get_attr "zero-terminated" attrs |> Utils.parse_bool
    in
    let fixed_size =
      match get_attr "fixed-size" attrs with
      | Some s -> ( try Some (int_of_string s) with _ -> None)
      | None -> None
    in
    let array_name = get_attr "name" attrs in

    (* Parse the element type from nested <type> element *)
    let element_type =
      ref
        {
          name = "unknown";
          c_type = None;
          nullable = false;
          transfer_ownership = transfer_ownership_attr;
          array = None;
        }
    in

    let rec parse_array_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), type_attrs) ->
          let type_name =
            match get_attr "name" type_attrs with
            | Some n -> n
            | None -> "unknown"
          in
          let c_type_name = get_attr "c:type" type_attrs in
          let nullable =
            get_attr "nullable" type_attrs |> Utils.parse_bool || nullable_attr
          in
          element_type :=
            {
              name = type_name;
              c_type = c_type_name;
              nullable;
              transfer_ownership = transfer_ownership_attr;
              array = None;
            };
          skip_element input 1;
          parse_array_contents ()
      | `El_start _ ->
          skip_element input 1;
          parse_array_contents ()
      | `El_end -> ()
      | `Data _ | `Dtd _ -> parse_array_contents ()
    in

    parse_array_contents ();
    Some
      {
        Types.length;
        zero_terminated;
        fixed_size;
        element_type = !element_type;
        array_name;
      }
  (* Parse return value type *)
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
    let type_info =
      ref
        {
          name = "void";
          c_type = None;
          nullable = nullable_attr;
          transfer_ownership = transfer_ownership_attr;
          array = None;
        }
    in

    let rec parse_rv_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), attrs) ->
          let type_name =
            match get_attr "name" attrs with Some n -> n | None -> "void"
          in
          let c_type_name = get_attr "c:type" attrs in
          let nullable =
            get_attr "nullable" attrs |> Utils.parse_bool || nullable_attr
          in
          (* Parse nested type element for element type (always do this for generic handling)
             EXCEPT for GLib.HashTable which has key/value types, not an element type *)
          let is_hash_table = type_name = "GLib.HashTable" in
          let element_type_ref = ref None in
          if not is_hash_table then begin
            let rec parse_element_type () =
              match Xmlm.input input with
              | `El_start ((_, "type"), elem_attrs) ->
                  let elem_name =
                    match get_attr "name" elem_attrs with Some n -> n | None -> "unknown"
                  in
                  let elem_c_type = get_attr "c:type" elem_attrs in
                  element_type_ref :=
                    Some
                      {
                        name = elem_name;
                        c_type = elem_c_type;
                        nullable = false;
                        transfer_ownership = transfer_ownership_attr;
                        array = None;
                      };
                  skip_element input 1;
                  parse_element_type ()
              | `El_start _ ->
                  skip_element input 1;
                  parse_element_type ()
              | `El_end -> ()
              | `Data _ | `Dtd _ -> parse_element_type ()
            in
            parse_element_type ()
          end
          else
            skip_element input 1;
          type_info :=
            {
              name = type_name;
              c_type = c_type_name;
              nullable;
              transfer_ownership = transfer_ownership_attr;
              array =
                (match !element_type_ref with
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
            };
          parse_rv_contents ()
      | `El_start ((_, "array"), array_attrs) ->
          let array_info =
            parse_array_type array_attrs transfer_ownership_attr nullable_attr
          in
          type_info :=
            {
              name = "array";
              c_type = get_attr "c:type" array_attrs;
              nullable = nullable_attr;
              transfer_ownership = transfer_ownership_attr;
              array = array_info;
            };
          parse_rv_contents ()
      | `El_start _ ->
          skip_element input 1;
          parse_rv_contents ()
      | `El_end -> ()
      | `Data _ -> parse_rv_contents ()
      | `Dtd _ -> parse_rv_contents ()
    in

    parse_rv_contents ();
    !type_info
  and parse_function attrs =
    let function_name = get_attr "name" attrs in
    let c_identifier = get_attr "c:identifier" attrs in
    let return_type = ref None in
    let params = ref [] in
    let doc : string option ref = ref None in
    let throws = get_attr "throws" attrs |> Utils.parse_bool in
    let introspectable =
      get_attr "introspectable" attrs |> Utils.parse_bool ~default:true
    in

    let rec parse_function_contents () =
      match Xmlm.input input with
      | `El_start ((_, "return-value"), attrs) ->
          let type_name =
            match get_attr "name" attrs with Some n -> n | None -> "void"
          in
          let c_type_name = get_attr "c:type" attrs in
          let nullable =
            get_attr "nullable" attrs |> Utils.parse_bool ~default:false
          in
          return_type :=
            Some
              {
                name = type_name;
                c_type = c_type_name;
                nullable;
                transfer_ownership = Types.TransferNone;
                array = None;
              };
          skip_element input 1;
          parse_function_contents ()
      | `El_start ((_, "parameters"), _) ->
          params := parse_parameters ();
          parse_function_contents ()
      | `El_start ((_, "doc"), _) ->
          doc := element_data input ();
          parse_function_contents ()
      | `El_start _ ->
          skip_element input 1;
          parse_function_contents ()
      | `El_end -> ()
      | `Data _ -> parse_function_contents ()
      | `Dtd _ -> parse_function_contents ()
    in

    parse_function_contents ();
    match (function_name, c_identifier, !return_type) with
    | Some function_name, Some c_identifier, Some return_type ->
        {
          function_name;
          c_identifier;
          return_type;
          parameters = List.rev !params;
          doc = !doc;
          throws;
          introspectable;
          version = get_attr "version" attrs;
          version_namespace = None;
        }
    | _, _, _ -> failwith "Unable to parse function correctly"
  (* Parse parameters list *)
  and parse_parameters () =
    let params = ref [] in

    let rec parse_params_contents () =
      match Xmlm.input input with
      | `El_start ((_, "parameter"), attrs) ->
          let param_name =
            match get_attr "name" attrs with Some n -> n | None -> "arg"
          in
          let nullable =
            match get_attr "nullable" attrs with Some "1" -> true | _ -> false
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
          let varargs = ref false in
          let type_ =
            ref
              {
                name = "void";
                c_type = None;
                nullable = false;
                transfer_ownership;
                array = None;
              }
          in
          let rec parse_param_contents () =
            match Xmlm.input input with
            | `El_start ((_, "varargs"), _attrs) ->
                varargs := true;
                skip_element input 1;
                parse_param_contents ()
            | `El_start ((_, "type"), attrs) ->
                let type_name =
                  match get_attr "name" attrs with
                  | Some n -> n
                  | None -> "void"
                in
                let c_type_name = get_attr "c:type" attrs in
                let nullable = get_attr "nullable" attrs |> Utils.parse_bool in
                (* Parse nested type element for element type (but not for HashTable) *)
                let is_hash_table = type_name = "GLib.HashTable" in
                let element_type_ref = ref None in
                if not is_hash_table then begin
                  let rec parse_element_type () =
                    match Xmlm.input input with
                    | `El_start ((_, "type"), elem_attrs) ->
                        let elem_name =
                          match get_attr "name" elem_attrs with Some n -> n | None -> "unknown"
                        in
                        let elem_c_type = get_attr "c:type" elem_attrs in
                        element_type_ref :=
                          Some
                            {
                              name = elem_name;
                              c_type = elem_c_type;
                              nullable = false;
                              transfer_ownership = transfer_ownership;
                              array = None;
                            };
                        skip_element input 1;
                        parse_element_type ()
                    | `El_start _ ->
                        skip_element input 1;
                        parse_element_type ()
                    | `El_end -> ()
                    | `Data _ | `Dtd _ -> parse_element_type ()
                  in
                  parse_element_type ()
                end
                else
                  skip_element input 1;
                type_ :=
                  {
                    name = type_name;
                    c_type = c_type_name;
                    nullable;
                    transfer_ownership;
                    array =
                      (match !element_type_ref with
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
                  };
                parse_param_contents ()
            | `El_start ((_, "array"), array_attrs) ->
                let nullable_param =
                  get_attr "nullable" attrs |> Utils.parse_bool
                in
                let array_info =
                  parse_array_type array_attrs transfer_ownership nullable_param
                in
                type_ :=
                  {
                    name = "array";
                    c_type = get_attr "c:type" array_attrs;
                    nullable = nullable_param;
                    transfer_ownership;
                    array = array_info;
                  };
                parse_param_contents ()
            | `El_start _ ->
                skip_element input 1;
                parse_param_contents ()
            | `El_end -> (!type_, !varargs)
            | `Data _ | `Dtd _ -> parse_param_contents ()
          in
          let param_type, varargs = parse_param_contents () in
          params :=
            { param_name; param_type; direction; nullable; varargs; caller_allocates } :: !params;
          parse_params_contents ()
      | `El_start ((_, "instance-parameter"), _) ->
          skip_element input 1;
          parse_params_contents ()
      | `El_start _ ->
          skip_element input 1;
          parse_params_contents ()
      | `El_end -> ()
      | `Data _ -> parse_params_contents ()
      | `Dtd _ -> parse_params_contents ()
    in

    parse_params_contents ();
    !params
  and parse_repository _ =
    let repository_c_includes = ref [] in
    let repository_includes = ref [] in
    let repository_packages = ref [] in
    let rec parse_repository_contents () =
      match Xmlm.peek input with
      | `El_start (("http://www.gtk.org/introspection/c/1.0", "include"), attrs)
        ->
          let name = get_attr "name" attrs in

          (match name with
          | Some name -> repository_c_includes := name :: !repository_c_includes
          | _ -> ());
          ignore (Xmlm.input input);
          skip_element input 1;
          parse_repository_contents ()
      | `El_start
          (("http://www.gtk.org/introspection/core/1.0", "include"), attrs) ->
          let name = get_attr "name" attrs in
          let version = get_attr "version" attrs in
          let _ =
            match (name, version) with
            | Some name, Some version ->
                repository_includes :=
                  { include_name = name; include_version = version }
                  :: !repository_includes
            | _ -> ()
          in
          ignore (Xmlm.input input);
          skip_element input 1;
          parse_repository_contents ()
      | `El_start
          (("http://www.gtk.org/introspection/core/1.0", "package"), attrs) ->
          let name = get_attr "name" attrs in

          let _ =
            match name with
            | Some name -> repository_packages := name :: !repository_packages
            | _ -> ()
          in
          ignore (Xmlm.input input);
          skip_element input 1;
          parse_repository_contents ()
      | `El_start ((_, "namespace"), _) -> ()
      | _ ->
          ignore (Xmlm.input input);
          parse_repository_contents ()
    in
    parse_repository_contents ();
    {
      repository_c_includes = !repository_c_includes;
      repository_includes = !repository_includes;
      repository_packages = !repository_packages;
    }
  (* Parse a record element *)
  and parse_record attrs =
    match (get_attr "name" attrs, get_attr "c:type" attrs) with
    | Some record_name, Some c_type ->
        let introspectable =
          get_attr "introspectable" attrs |> Utils.parse_bool ~default:true
        in
        (* glib:type-name/get-type are namespaced attributes; the local names are "type-name" and "get-type" *)
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
        let fields = ref [] in
        let constructors = ref [] in
        let methods = ref [] in
        let functions = ref [] in
        let record_doc : string option ref = ref None in

        let rec parse_record_contents () =
          match Xmlm.input input with
          | `El_start ((_, raw_tag), field_attrs)
            when local_name raw_tag = "field" ->
              let field_name = get_attr "name" field_attrs in
              let readable =
                get_attr "readable" field_attrs |> Utils.parse_bool
              in
              let writable =
                get_attr "writable" field_attrs |> Utils.parse_bool
              in
              let field_type = ref None in
              let field_doc = ref None in

              let rec parse_field_contents () =
                match Xmlm.input input with
                | `El_start ((_, "type"), type_attrs) ->
                    let type_name =
                      Option.value ~default:"unknown"
                        (get_attr "name" type_attrs)
                    in
                    let c_type_name = get_attr "c:type" type_attrs in
                    let nullable =
                      get_attr "nullable" type_attrs |> Utils.parse_bool
                    in
                    field_type :=
                      Some
                        {
                          name = type_name;
                          c_type = c_type_name;
                          nullable;
                          transfer_ownership = Types.TransferNone;
                          array = None;
                        };
                    skip_element input 1;
                    parse_field_contents ()
                | `El_start ((_, "array"), array_attrs) ->
                    let array_info =
                      parse_array_type array_attrs Types.TransferNone false
                    in
                    field_type :=
                      Some
                        {
                          name = "array";
                          c_type = get_attr "c:type" array_attrs;
                          nullable = false;
                          transfer_ownership = Types.TransferNone;
                          array = array_info;
                        };
                    parse_field_contents ()
                | `El_start ((_, tag), _) when local_name tag = "doc" ->
                    field_doc := parse_doc_text input ();
                    parse_field_contents ()
                | `El_start _ ->
                    skip_element input 1;
                    parse_field_contents ()
                | `El_end -> ()
                | `Data _ | `Dtd _ -> parse_field_contents ()
              in

              parse_field_contents ();
              (match field_name with
              | Some name ->
                  fields :=
                    {
                      field_name = name;
                      field_type = !field_type;
                      readable;
                      writable;
                      field_doc = !field_doc;
                      field_version = get_attr "version" field_attrs;
                    }
                    :: !fields
              | None -> ());
              parse_record_contents ()
          | `El_start ((_, raw_tag), tag_attrs)
            when local_name raw_tag = "constructor" -> (
              match
                (get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs)
              with
              | Some ctor_name, Some c_id ->
                  let throws = get_attr "throws" tag_attrs = Some "1" in
                  let ctor_introspectable =
                    get_attr "introspectable" tag_attrs
                    |> Utils.parse_bool ~default:true
                  in
                  let _return_type, params, doc, _, _ =
                    parse_method tag_attrs
                  in
                  constructors :=
                    {
                      ctor_name;
                      c_identifier = c_id;
                      ctor_parameters = params;
                      ctor_doc = doc;
                      throws;
                      ctor_introspectable;
                      version = get_attr "version" tag_attrs;
                      version_namespace = None;
                    }
                    :: !constructors;
                  parse_record_contents ()
              | _ ->
                  skip_element input 1;
                  parse_record_contents ())
           | `El_start ((_, raw_tag), tag_attrs)
             when local_name raw_tag = "method" -> (
               match
                 (get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs)
               with
               | Some method_name, Some c_id ->
                   let throws =
                     get_attr "throws" tag_attrs |> Utils.parse_bool
                   in
                   let introspectable =
                     get_attr "introspectable" tag_attrs
                     |> Utils.parse_bool ~default:true
                   in
                   let return_type, params, doc, get_property, set_property =
                     parse_method tag_attrs
                   in
                   methods :=
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
                       version = get_attr "version" tag_attrs;
                       version_namespace = None;
                     }
                     :: !methods;
                   parse_record_contents ()
               | _ ->
                   skip_element input 1;
                   parse_record_contents ())
          | `El_start ((_, raw_tag), _tag_attrs) when local_name raw_tag = "doc"
            ->
              record_doc := element_data input ();
              parse_record_contents ()
          | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "function"
            ->
              let function_ = parse_function attrs in
              functions := function_ :: !functions
          | `El_start _ ->
              skip_element input 1;
              parse_record_contents ()
          | `El_end -> ()
          | `Data _ -> parse_record_contents ()
          | `Dtd _ -> parse_record_contents ()
        in

        parse_record_contents ();
        Some
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
            fields = List.rev !fields;
            constructors = List.rev !constructors;
            methods = List.rev !methods;
            record_doc = !record_doc;
            functions = !functions;
            version = get_attr "version" attrs;
          }
    | _ ->
        skip_element input 1;
        None
  and parse_interface attrs () =
    let name = get_attr "name" attrs |> Option.get in
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
    let methods = ref [] in
    let virtual_methods = ref [] in
    let properties = ref [] in
    let signals = ref [] in
    let rec parse_class_contents () =
      match Xmlm.input input with
      | `El_start ((_, raw_tag), tag_attrs) -> (
          let tag = local_name raw_tag in
          match tag with
          | "signal" -> (
              match parse_signal tag_attrs with
              | Some signal ->
                  signals := signal :: !signals;
                  parse_class_contents ()
              | None ->
                  skip_element input 1;
                  parse_class_contents ())
          | "method" -> (
              match
                (get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs)
              with
              | Some method_name, Some c_id ->
                  let throws =
                    get_attr "throws" tag_attrs |> Utils.parse_bool
                  in
                  let introspectable =
                    get_attr "introspectable" tag_attrs
                    |> Utils.parse_bool ~default:true
                  in
                  let return_type, params, doc, get_property, set_property =
                    parse_method tag_attrs
                  in
                  methods :=
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
                      version = get_attr "version" tag_attrs;
                      version_namespace = None;
                    }
                    :: !methods;
                  parse_class_contents ()
              | _ ->
                  skip_element input 1;
                  parse_class_contents ())
          | "virtual-method" -> (
              match
                (get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs)
              with
              | Some method_name, Some c_id ->
                  let throws =
                    get_attr "throws" tag_attrs |> Utils.parse_bool
                  in
                  let introspectable =
                    get_attr "introspectable" tag_attrs
                    |> Utils.parse_bool ~default:true
                  in
                  let return_type, params, doc, get_property, set_property =
                    parse_method tag_attrs
                  in
                  virtual_methods :=
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
                      version = get_attr "version" tag_attrs;
                      version_namespace = None;
                    }
                    :: !virtual_methods;
                  parse_class_contents ()
              | _ ->
                  skip_element input 1;
                  parse_class_contents ())
          | "property" -> (
              match get_attr "name" tag_attrs with
              | Some prop_name ->
                  let prop = parse_property prop_name tag_attrs in
                  properties := prop :: !properties;
                  parse_class_contents ()
              | None ->
                  skip_element input 1;
                  parse_class_contents ())
          | _ ->
              skip_element input 1;
              parse_class_contents ())
      | `El_end -> ()
      | `Data _ -> parse_class_contents ()
      | `Dtd _ -> parse_class_contents ()
    in

    parse_class_contents ();
    let methods =
      merge_methods (List.rev !methods) (List.rev !virtual_methods)
    in
    Some
      {
        interface_name = name;
        c_type;
        c_symbol_prefix = name;
        methods;
        properties = List.rev !properties;
        signals = List.rev !signals;
        interface_doc = None;
        version = get_attr "version" attrs;
      }
  in

  (* Main parsing loop *)
  let rec parse_document () =
    if Xmlm.eoi input then ()
    else
      match Xmlm.input input with
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "class" ->
          (match parse_class attrs with
          | Some cls -> controllers := cls :: !controllers
          | None -> ());
          parse_document ()
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "interface" ->
          (match parse_interface attrs () with
          | Some cls -> interfaces := cls :: !interfaces
          | None -> ());
          parse_document ()
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "enumeration"
        ->
          (match
             parse_enumeration input
               ~parse_functions:(fun _ -> parse_function)
               attrs
           with
          | Some enum -> enums := enum :: !enums
          | None -> ());
          parse_document ()
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "bitfield" ->
          (match parse_bitfield input attrs with
          | Some bitfield -> bitfields := bitfield :: !bitfields
          | None -> ());
          parse_document ()
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "record" ->
          (match parse_record attrs with
          | Some record -> records := record :: !records
          | None -> ());
          parse_document ()
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "namespace" ->
          let namespace_name = Option.get (get_attr "name" attrs) in
          let namespace_version = Option.get (get_attr "version" attrs) in
          let namespace_shared_library =
            Option.get (get_attr "shared-library" attrs)
          in
          let namespace_c_identifier_prefixes =
            Option.get (get_attr "c:identifier-prefixes" attrs)
          in
          let namespace_c_symbol_prefixes =
            Option.get (get_attr "c:symbol-prefixes" attrs)
          in
          namespace :=
            Some
              {
                namespace_name;
                namespace_version;
                namespace_shared_library;
                namespace_c_identifier_prefixes;
                namespace_c_symbol_prefixes;
              };

          parse_document ()
      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "repository"
        ->
          repository := parse_repository attrs;
          parse_document ()
      | `El_start ((_, _), _) -> parse_document ()
      | `El_end -> parse_document ()
      | `Data _ -> parse_document ()
      | `Dtd _ -> parse_document ()
  in

  parse_document ();
  close_in ic;

  ( !repository,
    (try Option.get !namespace
     with _ -> failwith "Unable to parse namespace correctly"),
    List.rev !controllers,
    List.rev !interfaces,
    List.rev !enums,
    List.rev !bitfields,
    List.rev !records )
