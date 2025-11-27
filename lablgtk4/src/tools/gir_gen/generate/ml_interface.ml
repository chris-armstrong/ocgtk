(* OCaml Interface (.mli) Generation *)

open StdLabels
open Printf
open Types

type output_mode = Interface | Implementation

let sanitize_doc s =
  (* Prevent premature comment termination when GIR doc contains "*)" *)
  Str.global_replace (Str.regexp_string "*)") "\"*)\"" s

let generate_signal_bindings ~output_mode:_ ~module_name:_ ~has_widget_parent:_ _signals =
  ""  (* Signals are only generated in high-level g*.ml wrappers *)

let generate_ml_interface
    ~output_mode
    ~class_name
    ~class_doc
    ~enums ~bitfields ~classes ~records
    ~c_type
    ~parent_chain
    ~constructors
    ~methods
    ~properties
    ~signals:_
    ?c_symbol_prefix
    ?record_base_type
    ?(is_record = false)
    () =
  let buf = Buffer.create 1024 in
  let is_impl = match output_mode with Implementation -> true | Interface -> false in
  let is_copy_or_free (meth : gir_method) =
    let lower_name = String.lowercase_ascii meth.method_name in
    let lower_cid = String.lowercase_ascii meth.c_identifier in
    let ends_with suffix str =
      let len_s = String.length suffix and len_str = String.length str in
      len_str >= len_s && String.sub str ~pos:(len_str - len_s) ~len:len_s = suffix
    in
    lower_name = "copy" || lower_name = "free" ||
    ends_with "_copy" lower_cid || ends_with "_free" lower_cid
  in

  (* Determine if this is a controller or widget *)
  let is_controller =
    (not is_record) &&
    (class_name = "EventController" ||
     (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
     (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture"))
  in

  let normalized_class = Utils.normalize_class_name class_name in
  let parent_chain =
    if is_record then []
    else
      (* parent_chain is ordered immediate parent -> root; stop at Widget for variant generation *)
      let rec take_until_widget acc = function
        | [] -> List.rev acc
        | p :: rest ->
          let normalized_parent = Utils.normalize_class_name p in
          let acc' = normalized_parent :: acc in
          if String.lowercase_ascii normalized_parent = "widget" then
            List.rev acc'
          else
            take_until_widget acc' rest
      in
      take_until_widget [] parent_chain
  in
  let has_widget_parent =
    (not is_record) &&
    (String.lowercase_ascii normalized_class = "widget" ||
     List.exists parent_chain ~f:(fun p -> String.lowercase_ascii p = "widget"))
  in

  let class_type_name, base_type =
    if is_record then
      ("Record", Option.value record_base_type ~default:"Obj.t")
    else if is_controller then
      ("Event controller", "EventController.t")
    else if has_widget_parent then
      let self_variant = "`" ^ Utils.to_snake_case normalized_class in
      let parent_variants =
        if String.lowercase_ascii normalized_class = "widget" then
          []
        else
          List.fold_left parent_chain ~init:[] ~f:(fun acc parent ->
            let tag = "`" ^ Utils.to_snake_case parent in
            (* Stop adding parents once we hit widget to avoid pulling in GObject ancestry *)
            if String.lowercase_ascii parent = "widget" then
              acc @ [tag]
            else
              acc @ [tag]
          )
      in
      let variants = String.concat ~sep:" | " (self_variant :: parent_variants) in
      ("Widget", sprintf "[%s] Gobject.obj" variants)
    else
      ("Widget", "Gtk.widget")
  in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* %s: %s *)\n\n" class_type_name class_name;

  (match class_doc with
  | Some doc -> bprintf buf "(** %s *)\n" (sanitize_doc doc)
  | None -> ());

  bprintf buf "type t = %s\n\n" base_type;

  if has_widget_parent then begin
    if is_impl then
      bprintf buf "let as_widget (obj : t) : Gtk.widget = Obj.magic obj\n\n"
    else
      bprintf buf "val as_widget : t -> Gtk.widget\n\n"
  end;

  (* Constructors - generate unique names and proper signatures, skip those that throw *)
  List.iter ~f:(fun (ctor : gir_constructor) ->
    if not ctor.throws then begin
      bprintf buf "(** Create a new %s *)\n" class_name;
      let c_name = ctor.c_identifier in
      let ml_name =
        let prefixed = Str.global_replace (Str.regexp "^gtk_") "ml_gtk_" c_name in
        if String.length prefixed >= 3 && String.sub prefixed ~pos:0 ~len:3 = "ml_" then
          prefixed
        else
          "ml_" ^ c_name
      in

      (* Generate OCaml constructor name from C identifier *)
      let ocaml_ctor_name =
        let base = Filtering.ocaml_function_name ~class_name ~c_type ?c_symbol_prefix c_name in
        let snake = Utils.to_snake_case base in
        if snake = "new" then "new_" else snake
      in

    (* Build parameter types for constructor signature *)
    let param_types = List.map ~f:(fun p ->
      match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes ~records p.param_type with
      | Some mapping ->
        let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in
        if p.nullable then
          sprintf "%s option" base_type
        else
          base_type
      | None ->
        eprintf "Warning: Unknown type for parameter: name=%s c_type=%s\n"
          p.param_type.name p.param_type.c_type;
        "unit"
    ) ctor.ctor_parameters in

    (* Generate signature: param1 -> param2 -> ... -> t *)
    let signature =
      if List.length param_types = 0 then
        "unit -> t"
      else
        String.concat ~sep:" -> " (param_types @ ["t"])
    in

    (* For >5 parameters, reference bytecode/native variants *)
    let param_count = if List.length ctor.ctor_parameters = 0 then 1 else List.length ctor.ctor_parameters in
    if param_count > 5 then
      bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
        ocaml_ctor_name signature ml_name ml_name
    else
      bprintf buf "external %s : %s = \"%s\"\n\n" ocaml_ctor_name signature ml_name;
    end
  ) (constructors |> Option.value ~default:[]);

  (* Properties - generate get/set externals *)
  let property_names = ref [] in

  if List.length properties > 0 then begin
    bprintf buf "(* Properties *)\n\n";
  List.iter ~f:(fun (prop : gir_property) ->
      let skip_prop =
        Exclude_list.is_excluded_type_name prop.prop_type.name ||
        Exclude_list.is_excluded_type_name prop.prop_type.c_type
      in
      let type_mapping_opt = if skip_prop then None else Type_mappings.find_type_mapping ~enums ~bitfields ~classes ~records prop.prop_type.c_type in
      match type_mapping_opt with
      | Some type_mapping ->
        let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
        let prop_snake = Utils.to_snake_case prop_name_cleaned in
        let class_snake = Utils.to_snake_case class_name in
        let base_prop_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some prop.prop_type.name) type_mapping.ocaml_type in
        let prop_ocaml_type =
          if prop.prop_type.nullable then
            sprintf "%s option" base_prop_type
          else
            base_prop_type
        in

        (* Generate getter if readable *)
        if prop.readable then begin
          let getter_name = sprintf "get_%s" prop_snake in
          property_names := getter_name :: !property_names;
          let c_getter = sprintf "ml_gtk_%s_get_%s" class_snake prop_snake in
          bprintf buf "(** Get property: %s *)\n" prop.prop_name;
          bprintf buf "external %s : t -> %s = \"%s\"\n\n"
            getter_name prop_ocaml_type c_getter;
        end;

        (* Generate setter if writable and not construct-only *)
        if prop.writable && not prop.construct_only then begin
          let setter_name = sprintf "set_%s" prop_snake in
          property_names := setter_name :: !property_names;
          let c_setter = sprintf "ml_gtk_%s_set_%s" class_snake prop_snake in
          bprintf buf "(** Set property: %s *)\n" prop.prop_name;
          bprintf buf "external %s : t -> %s -> unit = \"%s\"\n\n"
            setter_name prop_ocaml_type c_setter;
        end;
      | None ->
        ()
    ) properties;
  end;

  (* Methods - skip those that duplicate property getters/setters *)
  List.iter ~f:(fun (meth : gir_method) ->
    let c_name = meth.c_identifier in
    let param_count = 1 + List.length meth.parameters in
    let ml_name =
      let prefixed = Str.global_replace (Str.regexp "^gtk_") "ml_gtk_" c_name in
      if String.length prefixed >= 3 && String.sub prefixed ~pos:0 ~len:3 = "ml_" then
        prefixed
      else
        "ml_" ^ c_name
    in
    let ocaml_name =
      Filtering.ocaml_function_name ~class_name ~c_type ?c_symbol_prefix c_name
    in

    (* Skip if: variadic function, duplicates property, or unmapped return type *)
    let has_excluded_type =
      Exclude_list.is_excluded_type_name meth.return_type.name ||
      Exclude_list.is_excluded_type_name meth.return_type.c_type ||
      List.exists meth.parameters ~f:(fun p ->
        Exclude_list.is_excluded_type_name p.param_type.name ||
        Exclude_list.is_excluded_type_name p.param_type.c_type)
    in
    let should_skip_mli =
      Exclude_list.is_variadic_function c_name ||
      List.mem ocaml_name ~set:!property_names ||
      has_excluded_type ||
      Exclude_list.should_skip_method ~find_type_mapping:(Type_mappings.find_type_mapping ~enums ~bitfields ~classes ~records) ~enums ~bitfields meth ||
      (is_record && is_copy_or_free meth)
    in
    if not should_skip_mli then begin
      (match meth.doc with
      | Some doc -> bprintf buf "(** %s *)\n" (sanitize_doc doc)
      | None -> ());

      (* Build OCaml type signature - handle nullable parameters *)
      let param_types = List.filter_map ~f:(fun p ->
        match p.direction with
        | Out -> None
        | In | InOut ->
          Some (match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes ~records p.param_type with
          | Some mapping ->
            let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in
            if p.nullable then
              sprintf "%s option" base_type
            else
              base_type
          | None ->
            eprintf "Warning: Unknown type for method '%s' parameter: name=%s c_type=%s\n" meth.method_name
              p.param_type.name p.param_type.c_type;
            "unit")
      ) meth.parameters in

      let ret_type_ocaml =
        if meth.return_type.c_type = "void" then
          "unit"
        else
          match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes ~records meth.return_type with
          | Some mapping ->
            let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some meth.return_type.name) mapping.ocaml_type in
            if meth.return_type.nullable then
              sprintf "%s option" base_type
            else
              base_type
          | None ->
            eprintf "Warning: Unknown return type for method %s: name=%s c_type=%s\n"
              meth.method_name meth.return_type.name meth.return_type.c_type;
            "unit"
      in

      let out_types =
        meth.parameters
        |> List.filter_map ~f:(fun p ->
          match p.direction with
          | Out ->
            let base_param_type =
              if String.length p.param_type.c_type > 0 &&
                 String.sub p.param_type.c_type ~pos:(String.length p.param_type.c_type - 1) ~len:1 = "*"
              then { p.param_type with c_type = String.sub p.param_type.c_type ~pos:0 ~len:(String.length p.param_type.c_type - 1) }
              else p.param_type
            in
            (match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes ~records base_param_type with
            | Some mapping ->
              let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some base_param_type.name) mapping.ocaml_type in
              if base_param_type.nullable || p.nullable then
                Some (sprintf "%s option" base_type)
              else Some base_type
            | None ->
              eprintf "Warning: Unknown out parameter type for method %s: name=%s c_type=%s\n"
                meth.method_name p.param_type.name p.param_type.c_type;
              Some "unit")
          | In | InOut -> None)
      in

      let final_ret_type =
        match ret_type_ocaml, out_types with
        | "unit", [] -> "unit"
        | "unit", [single] -> single
        | "unit", lst -> String.concat ~sep:" * " lst
        | ret, [] -> ret
        | ret, lst -> String.concat ~sep:" * " (ret :: lst)
      in

      let final_ret_type = if meth.throws then sprintf "(%s, GError.t) result" final_ret_type else final_ret_type in

      let full_type =
        String.concat ~sep:" -> " (["t"] @ param_types @ [final_ret_type])
      in

      (* For methods with >5 parameters, use bytecode/native variant syntax *)
      if param_count > 5 then
        bprintf buf "external %s : %s = \"%s_bytecode\" \"%s_native\"\n\n"
          ocaml_name full_type ml_name ml_name
      else
        bprintf buf "external %s : %s = \"%s\"\n\n"
          ocaml_name full_type ml_name;
    end
  ) (List.rev methods);

  Buffer.contents buf
