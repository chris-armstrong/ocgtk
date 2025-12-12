(* High-level class generation (Step 3) *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

module StringSet = Set.Make(String)

let sanitize_name s =
  s |> String.map ~f:(function '-' -> '_' | c -> c) |> Utils.to_snake_case |> Filtering.sanitize_identifier

let signal_class_name class_name =
  sanitize_name class_name ^ "_signals"



let ocaml_method_name ~class_name ~c_type (meth : gir_method) =
  Filtering.ocaml_method_name ~class_name ~c_type meth |> sanitize_name

let parameter_name (p : gir_param) =
  Filtering.sanitize_identifier (sanitize_name p.param_name)

(* Check if a parameter is a hierarchy type and get its info *)
let get_param_hierarchy_info ~ctx (param : gir_param) : hierarchy_info option =
  Hierarchy_detection.get_hierarchy_info ctx param.param_type.name

let generate_signal_class ~ctx:_ ~class_name ~module_name ~signals =
  let buf = Buffer.create 256 in
  let signals =
    List.filter signals ~f:(fun s ->
      let is_void =
        let c_type = String.lowercase_ascii s.return_type.c_type in
        let name = String.lowercase_ascii s.return_type.name in
        c_type = "void" || name = "none"
      in
      is_void && s.sig_parameters = [])
  in
  if signals = [] then
    ""
  else begin
    let sig_class = signal_class_name class_name in
    bprintf buf "(* Signal handlers for %s *)\n" class_name;
    bprintf buf "class %s (obj : %s.t) = object\n" sig_class module_name;
    List.iter signals ~f:(fun s ->
      let m = sanitize_name s.signal_name in
      bprintf buf "  method %s ~callback =\n" m;
      bprintf buf "    Gobject.Signal.connect_simple (%s.as_widget obj :> [`widget] Gobject.obj) ~name:\"%s\" ~callback ~after:false\n\n"
        module_name s.signal_name;
    );
    bprintf buf "end\n\n";
    Buffer.contents buf
  end

let ocaml_type_of_gir_type ~ctx (gir_type : gir_type) =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some mapping ->
      let base = Type_mappings.qualify_ocaml_type ~gir_type_name:(Some gir_type.name) mapping.ocaml_type in
      let base = if gir_type.nullable then base ^ " option" else base in
      Some base
  | None -> None

let generate_property_methods ~ctx ~module_name ~seen (prop : gir_property) =
  if not (Filtering.should_generate_property ~ctx prop) then ("", seen)
  else
    let prop_snake = sanitize_name prop.prop_name in
    if StringSet.mem prop_snake seen then ("", seen) else
    let seen = StringSet.add prop_snake seen in
    let buf = Buffer.create 128 in
    if prop.readable then begin
      bprintf buf "  method %s () = %s.get_%s obj\n" prop_snake module_name prop_snake;
    end;
    if prop.writable && not prop.construct_only then
      bprintf buf "  method set_%s v = %s.set_%s obj v\n" prop_snake module_name prop_snake;
    let seen =
      if prop.writable && not prop.construct_only then StringSet.add ("set_" ^ prop_snake) seen
      else seen
    in
    (Buffer.contents buf, seen)

let has_type_variable type_str =
  (* Check if the type contains an underscore wildcard (like "_ Gdk.event") *)
  (* We look for patterns like "_ Gdk.event" which have a standalone underscore *)
  let parts = Str.split (Str.regexp "[ \t]+") type_str in
  List.exists ~f:(fun part -> part = "_") parts

let generate_property_signatures ~ctx ~seen (prop : gir_property) =
  if not (Filtering.should_generate_property ~ctx prop) then ("", seen)
  else
    match ocaml_type_of_gir_type ~ctx prop.prop_type with
    | None -> ("", seen)
    | Some ocaml_type ->
        let prop_snake = sanitize_name prop.prop_name in
        if StringSet.mem prop_snake seen then ("", seen) else
        let seen = StringSet.add prop_snake seen in
        let buf = Buffer.create 128 in
        if prop.readable then begin
          bprintf buf "    method %s : unit -> %s\n" prop_snake ocaml_type;
        end;
        if prop.writable && not prop.construct_only then
          bprintf buf "    method set_%s : %s -> unit\n" prop_snake ocaml_type;
        let seen =
          if prop.writable && not prop.construct_only then StringSet.add ("set_" ^ prop_snake) seen
          else seen
        in
        (Buffer.contents buf, seen)

let generate_method_wrappers ~ctx ~property_method_names ~property_base_names ~module_name ~class_name ~c_type ~seen (meth : gir_method) =
  let should_skip =
    Filtering.should_skip_method_binding ~ctx ~property_method_names ~property_base_names ~class_name ~c_type meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut)
  in
  if should_skip then ("", seen)
  else
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    if StringSet.mem ocaml_name seen then ("", seen) else
    let seen = StringSet.add ocaml_name seen in

    (* Check for hierarchy parameters *)
    let param_info = List.map meth.parameters ~f:(fun p ->
      (parameter_name p, p, get_param_hierarchy_info ~ctx p)
    ) in
    let has_hierarchy_params = List.exists param_info ~f:(fun (_, _, hier_opt) ->
      match hier_opt with
      | Some info -> info.hierarchy <> MonomorphicType
      | None -> false
    ) in

    (* Build type signature for the method (needed for type annotation) *)
    let param_hier_info = List.map meth.parameters ~f:(fun p ->
      (p, get_param_hierarchy_info ~ctx p)
    ) in
    let param_types =
      List.map param_hier_info ~f:(fun (p, hier_opt) ->
        match hier_opt with
        | Some hier when hier.hierarchy <> MonomorphicType ->
            
            let class_type = sprintf "%s.%s" hier.layer2_module hier.class_type_name in
            if p.nullable || p.param_type.nullable then
              Some (class_type ^ " option")
            else
              Some class_type
        | _ ->
            (* Regular type *)
            let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
            ocaml_type_of_gir_type ~ctx gir_type)
    in
    let return_type =
      if String.lowercase_ascii meth.return_type.c_type = "void" then Some "unit"
      else ocaml_type_of_gir_type ~ctx meth.return_type
    in

    (* Check if we need a type annotation (for polymorphic methods or object types) *)
    let needs_type_annotation =
      match param_types, return_type with
      | types, Some ret ->
          let all_types = List.filter_map types ~f:(fun x -> x) @ [ret] in
          (* Need annotation if we have type variables or # object types *)
          List.exists all_types ~f:has_type_variable ||
          List.exists all_types ~f:(fun t -> String.contains t '#')
      | _ -> false
    in

    (* Convert #Module.class_type to partial object type for .ml files *)
    let convert_to_partial_object_type type_str =
      (* Convert #GExpression.expression_skel to (<as_expression: Expression.t; ..> as 'a) *)
      List.fold_left param_hier_info ~init:type_str ~f:(fun acc (_, hier_opt) ->
        match hier_opt with
        | Some hier when hier.hierarchy <> MonomorphicType ->
            let class_type_pattern = sprintf "%s.%s" hier.layer2_module hier.class_type_name in
            let partial_obj = sprintf "%s.%s" hier.accessor_method hier.layer1_base_type in
            let pattern_option = class_type_pattern ^ " option" in
            let partial_option = partial_obj ^ " option" in
            (* Replace both with and without option *)
            acc
            |> Str.global_replace (Str.regexp_string pattern_option) partial_option
            |> Str.global_replace (Str.regexp_string class_type_pattern) partial_obj
        | _ -> acc)
    in

    let type_annotation_opt =
      if needs_type_annotation then
        match return_type with
        | Some ret when not (List.exists param_types ~f:(fun x -> x = None)) ->
            let param_types_clean = List.filter_map param_types ~f:(fun x -> x) in
            let final_ret =
              if meth.throws then sprintf "(%s, GError.t) result" ret
              else ret
            in
            let param_types_clean = if param_types_clean = [] then ["unit"] else param_types_clean in
            let signature = String.concat ~sep:" -> " (param_types_clean @ [final_ret]) in
            (* Convert # syntax to partial object types for .ml files *)
            let signature = convert_to_partial_object_type signature in
            (* Add explicit polymorphism if we have type variables OR # object types *)
            let has_type_var = List.exists (param_types_clean @ [final_ret]) ~f:has_type_variable in
            let has_object_type = List.exists (param_types_clean @ [final_ret]) ~f:(fun t -> String.contains t '#') in
            if has_type_var || has_object_type then
              Some (sprintf "'a. %s" signature)
            else
              Some signature
        | _ -> None
      else None
    in

    let buf = Buffer.create 256 in

    if has_hierarchy_params then begin
      (* Generate method with hierarchy parameter coercion *)
      let param_names = List.map param_info ~f:(fun (name, _, _) -> name) in
      let param_list = match param_names with
        | [] -> "()"
        | _ -> String.concat ~sep:" " param_names
      in

      (* Add type annotation if needed *)
      (match type_annotation_opt with
       | Some type_ann ->
           bprintf buf "  method %s : %s =\n    fun %s ->\n" ocaml_name type_ann
             (if param_list = "()" then "()" else param_list)
       | None ->
           bprintf buf "  method %s %s =\n" ocaml_name
             (if param_list = "()" then "()" else param_list));

      bprintf buf "    %s.%s obj" module_name ocaml_name;

      List.iter param_info ~f:(fun (name, p, hier_opt) ->
        match hier_opt with
        | Some hier when hier.hierarchy <> MonomorphicType ->
            if p.nullable || p.param_type.nullable then
              bprintf buf " (Option.map (fun c -> (c#%s )) %s)"
                hier.accessor_method  name
            else
              bprintf buf " (%s#%s )"
                name hier.accessor_method 
        | _ ->
            bprintf buf " %s" name
      );
      bprintf buf "\n"
    end else begin
      (* Regular method without hierarchy parameters *)
      let params = List.map meth.parameters ~f:parameter_name in
      let param_list =
        match params with
        | [] -> "()"
        | _ -> String.concat ~sep:" " params
      in
      (* Add type annotation if needed *)
      (match type_annotation_opt with
       | Some type_ann ->
           bprintf buf "  method %s : %s = fun %s -> %s.%s obj%s\n"
             ocaml_name type_ann
             (if param_list = "()" then "()" else param_list)
             module_name ocaml_name
             (if param_list = "()" then "" else " " ^ param_list)
       | None ->
           bprintf buf "  method %s %s = %s.%s obj%s\n"
             ocaml_name
             (if param_list = "()" then "()" else param_list)
             module_name
             ocaml_name
             (if param_list = "()" then "" else " " ^ param_list))
    end;

    (Buffer.contents buf, seen)

let generate_method_signatures ~ctx ~property_method_names ~property_base_names ~class_name ~c_type ~seen (meth : gir_method) =
  let should_skip =
    Filtering.should_skip_method_binding ~ctx ~property_method_names ~property_base_names ~class_name ~c_type meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut)
  in
  if should_skip then ("", seen)
  else
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    if StringSet.mem ocaml_name seen then ("", seen) else

    (* Check for hierarchy parameters *)
    let param_hier_info = List.map meth.parameters ~f:(fun p ->
      (p, get_param_hierarchy_info ~ctx p)
    ) in

    let param_types =
      List.map param_hier_info ~f:(fun (p, hier_opt) ->
        match hier_opt with
        | Some hier when hier.hierarchy <> MonomorphicType ->
            (* Use # syntax for hierarchy types *)
            let class_type = sprintf "#%s.%s" hier.layer2_module hier.class_type_name in
            if p.nullable || p.param_type.nullable then
              Some (class_type ^ " option")
            else
              Some class_type
        | _ ->
            (* Regular type *)
            let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
            ocaml_type_of_gir_type ~ctx gir_type)
    in
    if List.exists param_types ~f:(fun x -> x = None) then ("", seen) else
    let param_types = List.filter_map param_types ~f:(fun x -> x) in
    let return_type =
      if String.lowercase_ascii meth.return_type.c_type = "void" then Some "unit"
      else ocaml_type_of_gir_type ~ctx meth.return_type
    in
    match return_type with
    | None -> ("", seen)
    | Some return_type ->
        (* Wrap with result type if method throws *)
        let final_return_type =
          if meth.throws then sprintf "(%s, GError.t) result" return_type
          else return_type
        in
        let param_types = if param_types = [] then ["unit"] else param_types in
        (* Check if any type contains a type variable (like _ Gdk.event) *)
        (* Note: # syntax for object types is implicitly polymorphic, so we don't need 'a. for those *)
        let has_type_var = List.exists (param_types @ [final_return_type]) ~f:has_type_variable in
        let signature = String.concat ~sep:" -> " (param_types @ [final_return_type]) in
        let seen = StringSet.add ocaml_name seen in
        let buf = Buffer.create 256 in
        (* Add explicit polymorphism only for actual type variables (like _), not for # object types *)
        if has_type_var then
          bprintf buf "    method %s : 'a. %s\n" ocaml_name signature
        else
          bprintf buf "    method %s : %s\n" ocaml_name signature;
        (Buffer.contents buf, seen)

let generate_hierarchy_converter_method_impl ~(hierarchy_info : hierarchy_info) ~class_name buf =
  if String.equal class_name (hierarchy_info.gir_root) then
    bprintf buf "  method %s = obj\n"  hierarchy_info.accessor_method 
  else

  bprintf buf "  method %s = (%s.%s obj)\n"  hierarchy_info.accessor_method (Utils.module_name_of_class class_name) hierarchy_info.accessor_method

let generate_hierarchy_converter_method_sig ~hierarchy_info buf =
  bprintf buf "  method %s : %s\n" hierarchy_info.accessor_method hierarchy_info.layer1_base_type

let generate_class_module ~ctx ~class_name ~c_type ~parent_chain:_ ~methods ~properties ~signals =
  let buf = Buffer.create 2048 in
  let module_name = Class_utils.get_qualified_module_name ~ctx class_name in
  let class_snake = sanitize_name class_name in
  (* let widget_parent = has_widget_parent class_name parent_chain in *)

  begin
    (* Include signal class if widget has ANY signals defined in GIR *)
    (* This ensures method connect is always present when signals exist *)
    let has_any_signals = List.length signals > 0 in

    let hierarchy_info =  Hierarchy_detection.get_hierarchy_info ctx class_name in

    (* Check if this class is in the Widget hierarchy *)
    let in_widget_hierarchy =
      match hierarchy_info with
      | Some info -> info.hierarchy = WidgetHierarchy
      | None -> false
    in

    if has_any_signals then
      bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

    bprintf buf "(* High-level class for %s *)\n" class_name;
    bprintf buf "class %s_skel (obj : %s.t) = object (self)\n" class_snake module_name;

    if in_widget_hierarchy then
      bprintf buf "  inherit GObj.widget_impl (%s.as_widget obj)\n\n" module_name
    else
      (* Non-widget classes don't inherit from widget_impl *)
      bprintf buf "\n";

    if has_any_signals then begin
      let signal_module = "G" ^ class_snake ^ "_signals" in
      bprintf buf "  method connect = new %s.%s obj\n\n"
        signal_module (signal_class_name class_name)
    end;

    let seen = StringSet.empty in
    let property_method_names =
      Filtering.property_method_names ~ctx properties
    in
    let property_base_names =
      Filtering.property_base_names ~ctx properties
    in
    let seen, () =
      List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
        let chunk, seen = generate_property_methods ~ctx ~module_name ~seen prop in
        Buffer.add_string buf chunk;
        if chunk <> "" then Buffer.add_char buf '\n';
        (seen, ()))
    in
    let seen, () =
      List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) m ->
        let chunk, seen = generate_method_wrappers ~ctx ~property_method_names ~property_base_names ~module_name ~class_name ~c_type ~seen m in
        Buffer.add_string buf chunk;
        if chunk <> "" then Buffer.add_char buf '\n';
        (seen, ()))
    in
    ignore seen;

    Option.iter (fun hierarchy_info -> generate_hierarchy_converter_method_impl ~class_name ~hierarchy_info buf) hierarchy_info;

    bprintf buf "end\n\n";

    bprintf buf "class %s obj = object\n" class_snake;
    bprintf buf "  inherit %s_skel obj\n" class_snake;
    bprintf buf "end\n";

    Buffer.contents buf
  end

let generate_class_signature ~ctx ~class_name ~c_type ~parent_chain:_ ~methods ~properties ~signals =
  let buf = Buffer.create 1024 in
  let module_name = Class_utils.get_qualified_module_name ~ctx class_name in
  let class_snake = sanitize_name class_name in
  (* let widget_parent = has_widget_parent class_name parent_chain in *)

  begin
    (* Include signal class if widget has ANY signals defined in GIR *)
    (* This ensures method connect is always present when signals exist *)
    let has_any_signals = List.length signals > 0 in

    let hierarchy_info =  Hierarchy_detection.get_hierarchy_info ctx class_name in

    (* Check if this class is in the Widget hierarchy *)
    let in_widget_hierarchy =
      match hierarchy_info with
      | Some info -> info.hierarchy = WidgetHierarchy
      | None -> false
    in

    let property_method_names =
      Filtering.property_method_names ~ctx properties
    in
    let property_base_names =
      Filtering.property_base_names ~ctx properties
    in

    bprintf buf "class %s_skel : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";
    if in_widget_hierarchy then
      bprintf buf "    inherit GObj.widget_impl\n";
    if has_any_signals then begin
      let signal_module = "G" ^ class_snake ^ "_signals" in
      bprintf buf "    method connect : %s.%s\n" signal_module (signal_class_name class_name)
    end;
    let seen = StringSet.empty in
    let seen, () =
      List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
        let chunk, seen = generate_property_signatures ~ctx ~seen prop in
        Buffer.add_string buf chunk;
        (seen, ()))
    in
    let _seen, () =
      List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) meth ->
        let chunk, seen = generate_method_signatures ~ctx ~property_method_names ~property_base_names ~class_name ~c_type ~seen meth in
        Buffer.add_string buf chunk;
        (seen, ()))
    in

    Option.iter (fun hierarchy_info -> generate_hierarchy_converter_method_sig ~hierarchy_info buf) hierarchy_info;

    bprintf buf "  end\n\n";

    bprintf buf "class %s : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";
    bprintf buf "    inherit %s_skel\n" class_snake;
    bprintf buf "  end\n";

    Buffer.contents buf
  end

(* Generate combined class modules for cyclic dependencies *)
let generate_combined_class_module ~ctx ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in

  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Combined classes for cyclic dependencies *)\n\n";

  (* Sort entities by name for consistent output *)
  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in

  (* Generate each class *)
  List.iteri ~f:(fun i entity ->
    let _parent_chain = parent_chain_for_entity entity.name in
    (* When generating inside a combined module, we need the qualified name *)
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in

    let hierarchy_info =  Hierarchy_detection.get_hierarchy_info ctx entity.name in
    let has_any_signals = List.length entity.signals > 0 in
    let in_widget_hierarchy =
      match hierarchy_info with
      | Some info -> info.hierarchy = WidgetHierarchy
      | None -> false
    in

    if has_any_signals then
      bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

    (* Class declaration with 'and' for subsequent classes *)
    if i = 0 then
      bprintf buf "class %s_skel (obj : %s.t) = object (self)\n"
        class_snake module_name
    else
      bprintf buf "\nand %s_skel (obj : %s.t) = object (self)\n"
        class_snake module_name;

    if in_widget_hierarchy then
      bprintf buf "  inherit GObj.widget_impl (%s.as_widget obj)\n\n"
        module_name
    else
      bprintf buf "\n";

    if has_any_signals then begin
      let signal_module = "G" ^ class_snake ^ "_signals" in
      bprintf buf "  method connect = new %s.%s obj\n\n"
        signal_module (signal_class_name entity.name)
    end;

    let property_method_names = Filtering.property_method_names ~ctx entity.properties in
    let property_base_names = Filtering.property_base_names ~ctx entity.properties in
    let seen = StringSet.empty in

    let seen, () =
      List.fold_left entity.properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
        let chunk, seen = generate_property_methods ~ctx ~module_name ~seen prop in
        Buffer.add_string buf chunk;
        if chunk <> "" then Buffer.add_char buf '\n';
        (seen, ()))
    in

    let _seen, () =
      List.fold_left entity.methods ~init:(seen, ()) ~f:(fun (seen, ()) m ->
        let chunk, seen = generate_method_wrappers ~ctx ~property_method_names ~property_base_names ~module_name ~class_name:entity.name ~c_type:entity.c_type ~seen m in
        Buffer.add_string buf chunk;
        if chunk <> "" then Buffer.add_char buf '\n';
        (seen, ()))
    in

    Option.iter (fun hierarchy_info -> generate_hierarchy_converter_method_impl ~class_name:entity.name ~hierarchy_info buf) hierarchy_info;

    bprintf buf "end\n";
  ) sorted_entities;

  (* Now generate the non-_skel classes *)
  bprintf buf "\n";
  List.iteri ~f:(fun i entity ->
    let _module_name = Utils.module_name_of_class entity.name in
    let class_snake = sanitize_name entity.name in

    if i = 0 then
      bprintf buf "class %s obj = object\n" class_snake
    else
      bprintf buf "\nand %s obj = object\n" class_snake;

    bprintf buf "  inherit %s_skel obj\n" class_snake;
    bprintf buf "end\n";
  ) sorted_entities;

  Buffer.contents buf

(* Generate combined class signatures for cyclic dependencies *)
let generate_combined_class_signature ~ctx ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in

  (* Sort entities by name for consistent output *)
  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in

  (* Generate each class signature *)
  List.iteri ~f:(fun i entity ->
    let _parent_chain = parent_chain_for_entity entity.name in
    (* When generating inside a combined module, we need the qualified name *)
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in

    let has_any_signals = List.length entity.signals > 0 in
    let hierarchy_info =  Hierarchy_detection.get_hierarchy_info ctx entity.name in
    let in_widget_hierarchy =
      match hierarchy_info with
      | Some info -> info.hierarchy = WidgetHierarchy
      | None -> false
    in

    let property_method_names = Filtering.property_method_names ~ctx entity.properties in
    let property_base_names = Filtering.property_base_names ~ctx entity.properties in

    if i > 0 then bprintf buf "\n";
    bprintf buf "class %s_skel : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";
    if in_widget_hierarchy then
      bprintf buf "    inherit GObj.widget_impl\n";
    if has_any_signals then begin
      let signal_module = "G" ^ class_snake ^ "_signals" in
      bprintf buf "    method connect : %s.%s\n" signal_module (signal_class_name entity.name)
    end;

    let seen = StringSet.empty in
    let seen, () =
      List.fold_left entity.properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
        let chunk, seen = generate_property_signatures ~ctx ~seen prop in
        Buffer.add_string buf chunk;
        (seen, ()))
    in
    let _seen, () =
      List.fold_left entity.methods ~init:(seen, ()) ~f:(fun (seen, ()) meth ->
        let chunk, seen = generate_method_signatures ~ctx ~property_method_names ~property_base_names ~class_name:entity.name ~c_type:entity.c_type ~seen meth in
        Buffer.add_string buf chunk;
        (seen, ()))
    in
    Option.iter (fun hierarchy_info -> generate_hierarchy_converter_method_sig ~hierarchy_info buf) hierarchy_info;
    bprintf buf "  end\n";
  ) sorted_entities;

  (* Now generate the non-_skel class signatures *)
  bprintf buf "\n";
  List.iteri ~f:(fun i entity ->
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in

    if i > 0 then bprintf buf "\n";
    bprintf buf "class %s : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";
    bprintf buf "    inherit %s_skel\n" class_snake;
    bprintf buf "  end\n";
  ) sorted_entities;

  Buffer.contents buf
