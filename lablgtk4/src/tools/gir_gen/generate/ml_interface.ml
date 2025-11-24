(* OCaml Interface (.mli) Generation *)

open StdLabels
open Printf
open Types

type output_mode = Interface | Implementation

let generate_ml_interface ~output_mode ~class_name ~class_doc ~enums ~bitfields ~classes ~parent_chain ~constructors ~methods ~properties ~signals:_ =
  let buf = Buffer.create 1024 in
  let is_impl = match output_mode with Implementation -> true | Interface -> false in

  (* Determine if this is a controller or widget *)
  let is_controller =
    class_name = "EventController" ||
    (String.length class_name > 15 && String.sub ~pos:0 ~len:15 class_name = "EventController") ||
    (String.length class_name > 7 && String.sub ~pos:0 ~len:7 class_name = "Gesture")
  in

  let normalized_class = Utils.normalize_class_name class_name in
  let parent_chain =
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
    String.lowercase_ascii normalized_class = "widget" ||
    List.exists parent_chain ~f:(fun p -> String.lowercase_ascii p = "widget")
  in

  let class_type_name, base_type =
    if is_controller then
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
  | Some doc -> bprintf buf "(** %s *)\n" doc
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
      let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in

      (* Generate OCaml constructor name from C identifier *)
      let class_snake = Utils.to_snake_case class_name in
      let ocaml_ctor_name =
        let base = Str.global_replace (Str.regexp (sprintf "gtk_%s_" class_snake)) "" c_name in
        let snake = Utils.to_snake_case base in
        if snake = "new" then "new_" else snake
      in

    (* Build parameter types for constructor signature *)
    let param_types = List.map ~f:(fun p ->
      match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes p.param_type with
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
      let type_mapping_opt = Type_mappings.find_type_mapping ~enums ~bitfields ~classes prop.prop_type.c_type in
      match type_mapping_opt with
      | Some type_mapping ->
        let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
        let prop_snake = Utils.to_snake_case prop_name_cleaned in
        let class_snake = Utils.to_snake_case class_name in
        let prop_ocaml_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some prop.prop_type.name) type_mapping.ocaml_type in

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
    let ml_name = Str.global_replace (Str.regexp "gtk_") "ml_gtk_" c_name in
    let ocaml_name = Utils.to_snake_case (
      Str.global_replace (Str.regexp (sprintf "gtk_%s_"
        (Utils.to_snake_case class_name))) "" c_name
    ) in

    (* Skip if: variadic function, duplicates property, or unmapped return type *)
    let should_skip_mli =
      Blacklists.is_variadic_function c_name ||
      List.mem ocaml_name ~set:!property_names ||
      Blacklists.should_skip_method ~find_type_mapping:(Type_mappings.find_type_mapping ~enums ~bitfields ~classes) ~enums ~bitfields meth
    in
    if not should_skip_mli then begin
      (match meth.doc with
      | Some doc -> bprintf buf "(** %s *)\n" doc
      | None -> ());

      (* Build OCaml type signature - handle nullable parameters *)
      let param_types = List.map ~f:(fun p ->
        match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes p.param_type with
        | Some mapping ->
          let base_type = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some p.param_type.name) mapping.ocaml_type in
          if p.nullable then
            sprintf "%s option" base_type
          else
            base_type
        | None ->
          eprintf "Warning: Unknown type for method '%s' parameter: name=%s c_type=%s\n" meth.method_name
            p.param_type.name p.param_type.c_type;
          "unit"
      ) meth.parameters in

      let ret_type_ocaml =
        if meth.return_type.c_type = "void" then
          "unit"
        else
          match Type_mappings.find_type_mapping_for_gir_type ~enums ~bitfields ~classes meth.return_type with
          | Some mapping ->
            Type_mappings.qualify_ocaml_type ~gir_type_name:(Some meth.return_type.name) mapping.ocaml_type
          | None ->
            eprintf "Warning: Unknown return type for method %s: name=%s c_type=%s\n"
              meth.method_name meth.return_type.name meth.return_type.c_type;
            "unit"
      in

      (* Wrap return type in result if method throws errors *)
      let final_ret_type =
        if meth.throws then
          sprintf "(%s, GError.t) result" ret_type_ocaml
        else
          ret_type_ocaml
      in

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
