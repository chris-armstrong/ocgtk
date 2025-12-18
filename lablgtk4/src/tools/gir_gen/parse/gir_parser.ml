(* GIR XML Parser using xmlm *)

open StdLabels
open Types

module StringSet = Set.Make(String)

(* Get attribute value from XML attributes list *)
let get_attr name attrs =
  let glib_ns = "http://www.gtk.org/introspection/glib/1.0" in
  try
    List.assoc ("", name) attrs |> fun x -> Some x
  with Not_found ->
    (* Try with c: namespace *)
    try
      List.assoc ("http://www.gtk.org/introspection/c/1.0", String.sub ~pos:2 ~len:(String.length name - 2) name) attrs |> fun x -> Some x
    with Not_found ->
      (* Try with glib: namespace (used by signals) *)
      try
        let glib_name =
          match String.index_opt name ':' with
          | Some idx -> String.sub ~pos:(idx + 1) ~len:(String.length name - idx - 1) name
          | None -> name
        in
        List.assoc (glib_ns, glib_name) attrs |> fun x -> Some x
      with Not_found -> None

(* Parse only enums and bitfields from a GIR file (for external namespaces) *)
let parse_gir_enums_only filename =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

  let local_name tag =
    match String.index_opt tag ':' with
    | Some idx -> String.sub ~pos:(idx + 1) ~len:(String.length tag - idx - 1) tag
    | None -> tag
  in

  let enums = ref [] in
  let bitfields = ref [] in

  (* Skip to end of current element *)
  let rec skip_element depth =
    if depth = 0 then ()
    else
      match Xmlm.input input with
      | `El_start _ -> skip_element (depth + 1)
      | `El_end -> skip_element (depth - 1)
      | `Data _ -> skip_element depth
      | `Dtd _ -> skip_element depth
  in

  (* Parse enumeration element *)
  let parse_enumeration attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      if Exclude_list.is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let members = ref [] in

        let rec parse_enum_contents () =
          match Xmlm.input input with
          | `El_start ((_, tag), member_attrs) when local_name tag = "member" ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some member_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              members := {
                member_name = member_name;
                member_value = value;
                c_identifier = c_id;
                member_doc = None;
              } :: !members;
              skip_element 1;
              parse_enum_contents ()
            | _ ->
              skip_element 1;
              parse_enum_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_enum_contents ()

          | `El_end -> ()
          | `Data _ -> parse_enum_contents ()
          | `Dtd _ -> parse_enum_contents ()
        in

        parse_enum_contents ();
        Some {
          enum_name = name;
          enum_c_type = c_type;
          members = List.rev !members;
          enum_doc = None;
        }
      end
    | _ ->
      skip_element 1;
      None
  in

  (* Parse bitfield element *)
  let parse_bitfield attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      if Exclude_list.is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let flags = ref [] in

        let rec parse_bitfield_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some flag_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              flags := {
                flag_name = flag_name;
                flag_value = value;
                flag_c_identifier = c_id;
                flag_doc = None;
              } :: !flags;
              skip_element 1;
              parse_bitfield_contents ()
            | _ ->
              skip_element 1;
              parse_bitfield_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_bitfield_contents ()

          | `El_end -> ()
          | `Data _ -> parse_bitfield_contents ()
          | `Dtd _ -> parse_bitfield_contents ()
        in

        parse_bitfield_contents ();
        Some {
          bitfield_name = name;
          bitfield_c_type = c_type;
          flags = List.rev !flags;
          bitfield_doc = None;
        }
      end
    | _ ->
      skip_element 1;
      None
  in

  (* Main parsing loop - only look for enums and bitfields *)
  let rec parse_document () =
    if Xmlm.eoi input then ()
    else
      match Xmlm.input input with
      | `El_start ((_, tag), attrs) when local_name tag = "enumeration" ->
        (match parse_enumeration attrs with
        | Some enum -> enums := enum :: !enums
        | None -> ());
        parse_document ()

      | `El_start ((_, tag), attrs) when local_name tag = "bitfield" ->
        (match parse_bitfield attrs with
        | Some bitfield -> bitfields := bitfield :: !bitfields
        | None -> ());
        parse_document ()

      | `El_start ((_, tag), _) when tag = "repository" || tag = "namespace" ->
        parse_document ()

      | `El_start _ ->
        skip_element 1;
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

  let local_name tag =
    match String.index_opt tag ':' with
    | Some idx -> String.sub ~pos:(idx + 1) ~len:(String.length tag - idx - 1) tag
    | None -> tag
  in

  let controllers = ref [] in
  let interfaces : gir_interface list ref = ref [] in
  let enums = ref [] in
  let bitfields = ref [] in
  let records : gir_record list ref = ref [] in
  let signal_table : (string, gir_signal list) Hashtbl.t = Hashtbl.create 256 in
  let iface_signal_table : (string, gir_signal list) Hashtbl.t = Hashtbl.create 128 in

  let normalized_filters =
    List.fold_left filter_classes ~init:StringSet.empty ~f:(fun acc name ->
      StringSet.add (Utils.normalize_class_name name |> String.lowercase_ascii) acc)
  in
  let should_include_class name =
    if StringSet.is_empty normalized_filters then
      true
    else
      let normalized = Utils.normalize_class_name name |> String.lowercase_ascii in
      StringSet.mem normalized normalized_filters
  in

  (* Skip to end of current element *)
  let rec skip_element depth =
    if depth = 0 then ()
    else
      match Xmlm.input input with
      | `El_start _ -> skip_element (depth + 1)
      | `El_end -> skip_element (depth - 1)
      | `Data _ -> skip_element depth
      | `Dtd _ -> skip_element depth
  in

  let rec element_data ?(str = None) () =
    match Xmlm.input input with
    | `Data s -> element_data ~str:(Some((Option.value str ~default:"") ^ s)) ()
    | `El_end -> str
    | `El_start _ | `Dtd _ -> failwith "unwanted element inside data element"
  in

  (* Parse a class element *)
  let rec parse_class attrs =
    match get_attr "name" attrs with
    | Some name when should_include_class name ->
      let c_type = match get_attr "c:type" attrs with
        | Some t -> t
        | None -> "Gtk" ^ name
      in
      let parent = get_attr "parent" attrs in
      let constructors = ref [] in
      let methods = ref [] in
      let virtual_methods = ref [] in
      let properties = ref [] in
      let signals = ref [] in

      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, raw_tag), tag_attrs) ->
          let tag = local_name raw_tag in
          (match tag with
          | "constructor" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some ctor_name, Some c_id ->
              let throws = (get_attr "throws" tag_attrs = Some "1") in
              let (_return_type, params, doc, _, _) = parse_method tag_attrs in
              constructors := {
                ctor_name = ctor_name;
                c_identifier = c_id;
                ctor_parameters = params;
                ctor_doc = doc;
                throws = throws;
              } :: !constructors;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "signal" ->
            (match parse_signal tag_attrs with
            | Some signal ->
              signals := signal :: !signals;
              parse_class_contents ()
            | None ->
              skip_element 1;
              parse_class_contents ())

          | "method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
              let  throws = get_attr "throws" tag_attrs |> Utils.parse_bool in
              let (return_type, params, doc, get_property, set_property) = parse_method tag_attrs in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = doc;
                throws = throws;
                get_property = get_property;
                set_property = set_property;
              } :: !methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "virtual-method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
              let throws = get_attr "throws" tag_attrs |> Utils.parse_bool in
              let (return_type, params, doc, get_property, set_property) = parse_method tag_attrs in
              virtual_methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = doc;
                throws = throws;
                get_property = get_property;
                set_property = set_property;
              } :: !virtual_methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "property" ->
            (match get_attr "name" tag_attrs with
            | Some prop_name ->
              let prop = parse_property prop_name tag_attrs in
              properties := prop :: !properties;
              parse_class_contents ()
            | None ->
              skip_element 1;
              parse_class_contents ())

          | _ ->
            skip_element 1;
            parse_class_contents ())

        | `El_end ->
          ()  (* End of class *)

        | `Data _ ->
          parse_class_contents ()

        | `Dtd _ ->
          parse_class_contents ()
      in

      parse_class_contents ();
      let methods =
        let concrete = List.rev !methods in
        let virtuals = List.rev !virtual_methods in
        let is_dup m =
          List.exists ~f:(fun (c:gir_method) ->
            c.method_name = m.method_name || c.c_identifier = m.c_identifier) concrete
        in
        concrete @ (List.filter ~f:(fun m -> not (is_dup m)) virtuals)
      in
      Some {
        class_name = name;
        c_type = c_type;
        parent = parent;
        implements = [];
        constructors = List.rev !constructors;
        methods;
        properties = List.rev !properties;
        signals = List.rev !signals;
        class_doc = None;
      }

    | _ ->
      skip_element 1;
      None

  (* Parse property element *)
  and parse_property prop_name attrs =
    let writable = match get_attr "writable" attrs with
      | Some "1" -> true
      | _ -> false
    in
    let construct_only = match get_attr "construct-only" attrs with
      | Some "1" -> true
      | _ -> false
    in
    let property_nullable = get_attr "nullable" attrs |> Utils.parse_bool in

    (* Parse property type from child element *)
    let prop_type = ref { name = "unknown"; c_type = "unknown"; nullable = false } in

    let doc : string option ref = ref None in

    let rec parse_prop_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), type_attrs) ->
        let type_name = match get_attr "name" type_attrs with Some n -> n | None -> "unknown" in
        let c_type_name = match get_attr "c:type" type_attrs with Some t -> t | None -> type_name in
        let nullable = (get_attr "nullable" type_attrs |> Utils.parse_bool) || property_nullable in
        prop_type := { name = type_name; c_type = c_type_name; nullable };
        skip_element 1;
        parse_prop_contents ()
      | `El_start ((_, "doc"), _) ->
        doc := element_data ();
        parse_prop_contents ()
      | `El_start _ ->
        skip_element 1;
        parse_prop_contents ()
      | `El_end ->
        ()
      | `Data _ ->
        parse_prop_contents ()
      | `Dtd _ ->
        parse_prop_contents ()
    in

    parse_prop_contents ();
    {
      prop_name = prop_name;
      prop_type = !prop_type;
      readable = true;
      writable = writable;
      construct_only = construct_only;
      prop_doc = None;
    }

  (* Parse enumeration element *)
  and parse_enumeration attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      if Exclude_list.is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let members = ref [] in

        let rec parse_enum_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some member_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              members := {
                member_name = member_name;
                member_value = value;
                c_identifier = c_id;
                member_doc = None;
              } :: !members;
              skip_element 1;
              parse_enum_contents ()
            | _ ->
              skip_element 1;
              parse_enum_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_enum_contents ()

          | `El_end ->
            ()

          | `Data _ ->
            parse_enum_contents ()

          | `Dtd _ ->
            parse_enum_contents ()
        in

        parse_enum_contents ();
        Some {
          enum_name = name;
          enum_c_type = c_type;
          members = List.rev !members;
          enum_doc = None;
        }
      end

    | _ ->
      skip_element 1;
      None

  (* Parse bitfield element *)
  and parse_bitfield attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some name, Some c_type ->
      if Exclude_list.is_platform_specific_type name then begin
        skip_element 1;
        None
      end else begin
        let flags = ref [] in

        let rec parse_bitfield_contents () =
          match Xmlm.input input with
          | `El_start ((_, "member"), member_attrs) ->
            (match get_attr "name" member_attrs, get_attr "value" member_attrs, get_attr "c:identifier" member_attrs with
            | Some flag_name, Some value_str, Some c_id ->
              let value = try int_of_string value_str with _ -> 0 in
              flags := {
                flag_name = flag_name;
                flag_value = value;
                flag_c_identifier = c_id;
                flag_doc = None;
              } :: !flags;
              skip_element 1;
              parse_bitfield_contents ()
            | _ ->
              skip_element 1;
              parse_bitfield_contents ())

          | `El_start _ ->
            skip_element 1;
            parse_bitfield_contents ()

          | `El_end ->
            ()

          | `Data _ ->
            parse_bitfield_contents ()

          | `Dtd _ ->
            parse_bitfield_contents ()
        in

        parse_bitfield_contents ();
        Some {
          bitfield_name = name;
          bitfield_c_type = c_type;
          flags = List.rev !flags;
          bitfield_doc = None;
        }
      end

    | _ ->
      skip_element 1;
      None

  (* Parse method contents to extract return type and parameters *)
  and parse_method tag_attrs =
    let get_property = get_attr "glib:get-property" tag_attrs in
    let set_property = get_attr "glib:set-property" tag_attrs in
    let return_type = ref { name = "void"; c_type = "void"; nullable = false } in
    let params = ref [] in
    let doc: string option ref = ref None in
    let rec parse_method_contents () =
      match Xmlm.input input with
      | `El_start ((_, tag), _tag_attrs) ->
        (match tag with
        | "return-value" ->
          return_type := parse_return_value _tag_attrs;
          parse_method_contents ()

        | "parameters" ->
          params := parse_parameters ();
          parse_method_contents ()
        | "doc" ->
          doc := element_data ();
          parse_method_contents ()
        | _ ->
          skip_element 1;
          parse_method_contents ())

      | `El_end ->
        ()

      | `Data _ ->
        parse_method_contents ()

      | `Dtd _ ->
        parse_method_contents ()
    in

    parse_method_contents ();
    (!return_type, List.rev !params, !doc, get_property, set_property)

  (* Parse glib:signal elements *)
  and parse_signal attrs =
    match get_attr "name" attrs with
    | Some signal_name ->
      let return_type = ref { name = "void"; c_type = "void"; nullable = false } in
      let params = ref [] in
      let doc : string option ref = ref None in

      let rec parse_signal_contents () =
        match Xmlm.input input with
        | `El_start ((_, raw_tag), tag_attrs) ->
          let tag = local_name raw_tag in
          (match tag with
          | "return-value" ->
            return_type := parse_return_value tag_attrs;
            parse_signal_contents ()
          | "parameters" ->
            params := parse_parameters ();
            parse_signal_contents ()
          | "doc" ->
            doc := element_data ();
            parse_signal_contents ()
          | _ ->
            skip_element 1;
            parse_signal_contents ())

        | `El_end -> ()
        | `Data _ -> parse_signal_contents ()
        | `Dtd _ -> parse_signal_contents ()
      in

      parse_signal_contents ();
      Some {
        signal_name = signal_name;
        return_type = !return_type;
        sig_parameters = List.rev !params;
        doc = !doc;
      }
    | None ->
      skip_element 1;
      None

  (* Parse return value type *)
  and parse_return_value attrs =
    let nullable_attr = get_attr "nullable" attrs |> Utils.parse_bool in
    let type_info = ref { name = "void"; c_type = "void"; nullable = nullable_attr } in

    let rec parse_rv_contents () =
      match Xmlm.input input with
      | `El_start ((_, "type"), attrs) ->
        let type_name = match get_attr "name" attrs with Some n -> n | None -> "void" in
        let c_type_name = match get_attr "c:type" attrs with Some t -> t | None -> type_name in
        let nullable = (get_attr "nullable" attrs |> Utils.parse_bool) || nullable_attr in
        type_info := ({ name = type_name; c_type = c_type_name ; nullable = nullable}:gir_type);
        skip_element 1;
        parse_rv_contents ()

      | `El_start _ ->
        skip_element 1;
        parse_rv_contents ()

      | `El_end ->
        ()

      | `Data _ ->
        parse_rv_contents ()

      | `Dtd _ ->
        parse_rv_contents ()
    in

    parse_rv_contents ();
    !type_info

  (* Parse parameters list *)
  and parse_parameters () =
    let params = ref [] in

    let rec parse_params_contents () =
      match Xmlm.input input with
      | `El_start ((_, "parameter"), attrs) ->
        let param_name = match get_attr "name" attrs with Some n -> n | None -> "arg" in
        let nullable = match get_attr "nullable" attrs with Some "1" -> true | _ -> false in
        let direction =
          match get_attr "direction" attrs with
          | Some "out" -> Out
          | Some "inout" -> InOut
          | _ -> In
        in
        let varargs = ref false in
        let type_ = ref { name = "void"; c_type = "void"; nullable = false} in
        let rec parse_param_contents () =
          match Xmlm.input input with
          | `El_start ((_, "varargs"), _attrs) ->
            varargs := true;
            skip_element 1;
            parse_param_contents ()
          | `El_start ((_, "type"), attrs) ->
            let type_name = match get_attr "name" attrs with Some n -> n | None -> "void" in
            let c_type_name = match get_attr "c:type" attrs with Some t -> t | None -> type_name in
            let nullable = get_attr "nullable" attrs |> Utils.parse_bool in
            type_ := { name = type_name; c_type = c_type_name; nullable };
            skip_element 1;
            parse_param_contents ()
          | `El_start _ ->
            skip_element 1;
            parse_param_contents ()
          | `El_end -> (!type_, !varargs)
          | `Data _ | `Dtd _ ->
            parse_param_contents ()
        in
        let (param_type, varargs) = parse_param_contents () in
        params := { param_name = param_name; param_type = param_type; direction; nullable = nullable ; varargs = varargs} :: !params;
        parse_params_contents ()

      | `El_start ((_, "instance-parameter"), _) ->
        skip_element 1;
        parse_params_contents ()

      | `El_start _ ->
        skip_element 1;
        parse_params_contents ()

      | `El_end ->
        ()

      | `Data _ ->
        parse_params_contents ()

      | `Dtd _ ->
        parse_params_contents ()
    in

    parse_params_contents ();
    !params

  (* Parse a record element *)
  and parse_record attrs =
    match get_attr "name" attrs, get_attr "c:type" attrs with
    | Some record_name, Some c_type ->
      (* glib:type-name/get-type are namespaced attributes; the local names are "type-name" and "get-type" *)
      let glib_type_name = match get_attr "type-name" attrs with
        | Some v -> Some v
        | None -> get_attr "glib:type-name" attrs
      in
      let glib_get_type = match get_attr "get-type" attrs with
        | Some v -> Some v
        | None -> get_attr "glib:get-type" attrs
      in
      let opaque = get_attr "opaque" attrs |> Utils.parse_bool in
      let disguised = get_attr "disguised" attrs |> Utils.parse_bool in
      let c_symbol_prefix = get_attr "c:symbol-prefix" attrs in
      let fields = ref [] in
      let constructors = ref [] in
      let methods = ref [] in
      let record_doc : string option ref = ref None in

      let rec parse_record_contents () =
        match Xmlm.input input with
        | `El_start ((_, raw_tag), field_attrs) when local_name raw_tag = "field" ->
          let field_name = get_attr "name" field_attrs in
          let readable = get_attr "readable" field_attrs |> Utils.parse_bool in
          let writable = get_attr "writable" field_attrs |> Utils.parse_bool in
          let field_type = ref None in

          let rec parse_field_contents () =
            match Xmlm.input input with
            | `El_start ((_, "type"), type_attrs) ->
              let type_name = Option.value ~default:"unknown" (get_attr "name" type_attrs) in
              let c_type_name = Option.value ~default:type_name (get_attr "c:type" type_attrs) in
              let nullable = get_attr "nullable" type_attrs |> Utils.parse_bool in
              field_type := Some { name = type_name; c_type = c_type_name; nullable };
              skip_element 1;
              parse_field_contents ()
            | `El_start _ ->
              skip_element 1;
              parse_field_contents ()
            | `El_end -> ()
            | `Data _ | `Dtd _ ->
              parse_field_contents ()
          in

          parse_field_contents ();
          (match field_name with
          | Some name ->
            fields := {
              field_name = name;
              field_type = !field_type;
              readable;
              writable;
              field_doc = None;
            } :: !fields
          | None -> ());
          parse_record_contents ()

        | `El_start ((_, raw_tag), tag_attrs) when local_name raw_tag = "constructor" ->
          (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
          | Some ctor_name, Some c_id ->
            let throws = (get_attr "throws" tag_attrs = Some "1") in
            let (_return_type, params, doc, _, _) = parse_method tag_attrs in
            constructors := {
              ctor_name = ctor_name;
              c_identifier = c_id;
              ctor_parameters = params;
              ctor_doc = doc;
              throws;
            } :: !constructors;
            parse_record_contents ()
          | _ ->
            skip_element 1;
            parse_record_contents ())

        | `El_start ((_, raw_tag), tag_attrs) when local_name raw_tag = "method" ->
          (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
          | Some method_name, Some c_id ->
            let  throws = get_attr "throws" tag_attrs |> Utils.parse_bool in
            let (return_type, params, doc, get_property, set_property) = parse_method tag_attrs in
            methods := {
              method_name = method_name;
              c_identifier = c_id;
              return_type = return_type;
              parameters = params;
              doc = doc;
              throws = throws;
              get_property = get_property;
              set_property = set_property;
            } :: !methods;
            parse_record_contents ()
          | _ ->
            skip_element 1;
            parse_record_contents ())

        | `El_start ((_, raw_tag), _tag_attrs) when local_name raw_tag = "doc" ->
          record_doc := element_data ();
          parse_record_contents ()

        | `El_start _ ->
          skip_element 1;
          parse_record_contents ()

        | `El_end -> ()
        | `Data _ ->
          parse_record_contents ()
        | `Dtd _ ->
          parse_record_contents ()
      in

      parse_record_contents ();
      Some {
        record_name;
        c_type;
        glib_type_name;
        glib_get_type;
        opaque;
        disguised;
        c_symbol_prefix;
        fields = List.rev !fields;
        constructors = List.rev !constructors;
        methods = List.rev !methods;
        record_doc = !record_doc;
      }

    | _ ->
      skip_element 1;
      None

  and parse_interface attrs () =
    let name  = get_attr "name" attrs  |> Option.get in
    let c_type = match get_attr "c:type" attrs with
      | Some t -> t
      | None -> "Gtk" ^ name
    in
    let methods = ref [] in
    let virtual_methods = ref [] in
    let properties = ref [] in
    let signals = ref [] in
      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, raw_tag), tag_attrs) ->
          let tag = local_name raw_tag in
          (match tag with

          | "signal" ->
            (match parse_signal tag_attrs with
            | Some signal ->
              signals := signal :: !signals;
              parse_class_contents ()
            | None ->
              skip_element 1;
              parse_class_contents ())

          | "method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
                let  throws = get_attr "throws" tag_attrs |> Utils.parse_bool in
              let (return_type, params, doc, get_property, set_property) = parse_method tag_attrs in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = doc;
                throws = throws;
                get_property = get_property;
                set_property = set_property;
              } :: !methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "virtual-method" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some method_name, Some c_id ->
              let  throws = get_attr "throws" tag_attrs |> Utils.parse_bool in
              let (return_type, params, doc, get_property, set_property) = parse_method tag_attrs in
              virtual_methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = doc;
                throws = throws;
                get_property = get_property;
                set_property = set_property;
              } :: !virtual_methods;
              parse_class_contents ()
            | _ ->
              skip_element 1;
              parse_class_contents ())

          | "property" ->
            (match get_attr "name" tag_attrs with
            | Some prop_name ->
              let prop = parse_property prop_name tag_attrs in
              properties := prop :: !properties;
              parse_class_contents ()
            | None ->
              skip_element 1;
              parse_class_contents ())

          | _ ->
            skip_element 1;
            parse_class_contents ())

        | `El_end ->
          ()

        | `Data _ ->
          parse_class_contents ()

        | `Dtd _ ->
          parse_class_contents ()
      in

      parse_class_contents ();
    let methods =
      let concrete = List.rev !methods in
      let virtuals = List.rev !virtual_methods in
      let is_dup m =
        List.exists ~f:(fun (c:gir_method) ->
          c.method_name = m.method_name || c.c_identifier = m.c_identifier) concrete
      in
      concrete @ (List.filter ~f:(fun m -> not (is_dup m)) virtuals)
    in
    Some { interface_name = name; c_type = c_type; c_symbol_prefix = name; methods; properties = List.rev !properties; signals = List.rev !signals; interface_doc = None }
  in

  (* Second pass: collect signals reliably across classes/interfaces *)
  let collect_signals () =
    let ic2 = open_in filename in
    let input2 = Xmlm.make_input ~strip:true (`Channel ic2) in
    let current = ref None in
    let current_is_interface = ref false in
    let depth = ref 0 in

    let rec skip_element2 d =
      if d = 0 then ()
      else
        match Xmlm.input input2 with
        | `El_start _ -> skip_element2 (d + 1)
        | `El_end -> skip_element2 (d - 1)
        | `Data _ | `Dtd _ -> skip_element2 d
    in

    let record_signal attrs =
      match (!current, get_attr "name" attrs) with
      | Some cls_name, Some signal_name ->
        (* Consume nested children to keep the stream in sync *)
        skip_element2 1;
        let signal = {
          signal_name;
          return_type = { name = "none"; c_type = "void"; nullable = false };
          sig_parameters = [];
          doc = None;
        } in
        let tbl = if !current_is_interface then iface_signal_table else signal_table in
        let existing = Hashtbl.find_opt tbl cls_name |> Option.value ~default:[] in
        Hashtbl.replace tbl cls_name (signal :: existing)
      | _ ->
        skip_element2 1
    in

    let rec loop () =
      if Xmlm.eoi input2 then ()
      else
        match Xmlm.input input2 with
        | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "class" ->
          current := get_attr "name" attrs;
          current_is_interface := false;
          depth := 1;
          loop ()
        | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "interface" ->
          current := get_attr "name" attrs;
          current_is_interface := true;
          depth := 1;
          loop ()
        | `El_start ((_, raw_tag), attrs) when !current <> None && local_name raw_tag = "signal" ->
          incr depth;
          record_signal attrs;
          decr depth;
          loop ()
        | `El_start _ ->
          if !current <> None then incr depth;
          loop ()
        | `El_end ->
          if !current <> None then begin
            decr depth;
            if !depth = 0 then current := None
          end;
          loop ()
        | `Data _ | `Dtd _ ->
          loop ()
    in

    loop ();
    close_in ic2
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

      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "enumeration" ->
        (match parse_enumeration attrs with
        | Some enum -> enums := enum :: !enums
        | None -> ());
        parse_document ()

      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "bitfield" ->
        (match parse_bitfield attrs with
        | Some bitfield -> bitfields := bitfield :: !bitfields
        | None -> ());
        parse_document ()

      | `El_start ((_, raw_tag), attrs) when local_name raw_tag = "record" ->
        (match parse_record attrs with
        | Some record -> records := record :: !records
        | None -> ());
        parse_document ()

      | `El_start ((_, raw_tag), _) ->
        let tag = local_name raw_tag in
        if tag = "repository" || tag = "namespace" then
          parse_document ()
        else begin
        parse_document ()
        end

      | `El_end ->
        parse_document ()

      | `Data _ ->
        parse_document ()

      | `Dtd _ ->
        parse_document ()
  in

  parse_document ();
  close_in ic;
  collect_signals ();

  let merge_class_signals cls =
    let extras = Hashtbl.find_opt signal_table cls.class_name |> Option.value ~default:[] |> List.rev in
    let base = cls.signals in
    let deduped_extras =
      List.filter extras ~f:(fun (s:gir_signal) ->
        not (List.exists base ~f:(fun existing -> existing.signal_name = s.signal_name)))
    in
    let combined = base @ deduped_extras in
    if combined == cls.signals then cls else { cls with signals = combined }
  in

  let merge_interface_signals iface =
    let extras = Hashtbl.find_opt iface_signal_table iface.interface_name |> Option.value ~default:[] |> List.rev in
    let base = iface.signals in
    let deduped_extras =
      List.filter extras ~f:(fun (s:gir_signal) ->
        not (List.exists base ~f:(fun existing -> existing.signal_name = s.signal_name)))
    in
    let combined = base @ deduped_extras in
    if combined == iface.signals then iface else { iface with signals = combined }
  in

  let controllers = List.rev_map ~f:merge_class_signals !controllers in
  let interfaces = List.rev_map ~f:merge_interface_signals !interfaces in

  (controllers, interfaces, List.rev !enums, List.rev !bitfields, List.rev !records)
