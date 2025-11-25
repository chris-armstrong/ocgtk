(* GIR XML Parser using xmlm *)

open StdLabels
open Types

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
        List.assoc (glib_ns, name) attrs |> fun x -> Some x
      with Not_found -> None

(* Parse only enums and bitfields from a GIR file (for external namespaces) *)
let parse_gir_enums_only filename =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

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
      if Blacklists.is_platform_specific_type name then begin
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
      if Blacklists.is_platform_specific_type name then begin
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
      | `El_start ((_, "enumeration"), attrs) ->
        (match parse_enumeration attrs with
        | Some enum -> enums := enum :: !enums
        | None -> ());
        parse_document ()

      | `El_start ((_, "bitfield"), attrs) ->
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
let parse_gir_file filename _filter_classes =
  let ic = open_in filename in
  let input = Xmlm.make_input ~strip:true (`Channel ic) in

  let controllers = ref [] in
  let interfaces : gir_interface list ref = ref [] in
  let enums = ref [] in
  let bitfields = ref [] in

  (* Check if class should be included based on mode and filter *)
  let should_include_class _name = true
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
      let properties = ref [] in
      let signals = ref [] in

      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, tag), tag_attrs) ->
          (match tag with
          | "constructor" ->
            (match get_attr "name" tag_attrs, get_attr "c:identifier" tag_attrs with
            | Some ctor_name, Some c_id ->
              let throws = (get_attr "throws" tag_attrs = Some "1") in
              let (_return_type, params, doc) = parse_method () in
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
              let (return_type, params, doc) = parse_method () in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = doc;
                throws = throws;
              } :: !methods;
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
      Some {
        class_name = name;
        c_type = c_type;
        parent = parent;
        implements = [];
        constructors = List.rev !constructors;
        methods = List.rev !methods;
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
      if Blacklists.is_platform_specific_type name then begin
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
      if Blacklists.is_platform_specific_type name then begin
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
  and parse_method () =
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
    (!return_type, List.rev !params, !doc)

  (* Parse glib:signal elements *)
  and parse_signal attrs =
    match get_attr "name" attrs with
    | Some signal_name ->
      let return_type = ref { name = "void"; c_type = "void"; nullable = false } in
      let params = ref [] in
      let doc : string option ref = ref None in

      let rec parse_signal_contents () =
        match Xmlm.input input with
        | `El_start ((_, tag), tag_attrs) ->
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

  and parse_interface attrs () =
    let name  = get_attr "name" attrs  |> Option.get in
    let c_type = match get_attr "c:type" attrs with
      | Some t -> t
      | None -> "Gtk" ^ name
    in
    let methods = ref [] in
    let properties = ref [] in
    let signals = ref [] in
      let rec parse_class_contents () =
        match Xmlm.input input with
        | `El_start ((_, tag), tag_attrs) ->
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
              let (return_type, params, doc) = parse_method () in
              methods := {
                method_name = method_name;
                c_identifier = c_id;
                return_type = return_type;
                parameters = params;
                doc = doc;
                throws = throws;
              } :: !methods;
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
    Some { interface_name = name; c_type = c_type; c_symbol_prefix = name; methods = List.rev !methods; properties = List.rev !properties; signals = List.rev !signals; interface_doc = None }
  in

  (* Main parsing loop *)
  let rec parse_document () =
    if Xmlm.eoi input then ()
    else
      match Xmlm.input input with
      | `El_start ((_, "class"), attrs) ->
        (match parse_class attrs with
        | Some cls -> controllers := cls :: !controllers
        | None -> ());
        parse_document ()

      | `El_start ((_, "interface"), attrs) ->
        (match parse_interface attrs () with
        | Some cls -> interfaces := cls :: !interfaces
        | None -> ());
        parse_document ()

      | `El_start ((_, "enumeration"), attrs) ->
        (match parse_enumeration attrs with
        | Some enum -> enums := enum :: !enums
        | None -> ());
        parse_document ()

      | `El_start ((_, "bitfield"), attrs) ->
        (match parse_bitfield attrs with
        | Some bitfield -> bitfields := bitfield :: !bitfields
        | None -> ());
        parse_document ()

      | `El_start ((_, tag), _) when tag = "repository" || tag = "namespace" ->
        parse_document ()

      | `El_start _ ->
        skip_element 1;
        parse_document ()

      | `El_end ->
        parse_document ()

      | `Data _ ->
        parse_document ()

      | `Dtd _ ->
        parse_document ()
  in

  parse_document ();
  close_in ic;
  (List.rev !controllers, List.rev !interfaces, List.rev !enums, List.rev !bitfields)
