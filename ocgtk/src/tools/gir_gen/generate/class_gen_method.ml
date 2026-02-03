(* Method generation code for class generation *)

[@@@warning "-32-33"]
open StdLabels
open Printf
open Types

(* Use Class_gen_helpers for shared functions
   Note: open StdLabels is needed here despite Class_gen_helpers having it,
   because opens don't propagate through include *)
include Class_gen_helpers

(* Map parameter to type signature string *)
let map_param_sig ~ctx ~same_cluster_classes ~current_layer2_module p =
  let hier_opt = get_param_hierarchy_info ~ctx p in
  match hier_opt with
  | Some _  ->
      (* Check if same cluster - use structural type *)
      if is_same_cluster_class ~same_cluster_classes p.param_type.name then
        let structural = structural_type_for_class ~ctx p.param_type.name in
        if p.nullable || p.param_type.nullable then
            (structural ^ " option")
        else
            structural
      else
        (* Use # syntax for hierarchy types *)
        (* let class_type = hierarchy_class_type ~current_layer2_module hier in *)
        let class_name = (Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:p.param_type) in
        let class_type = "#"^ (Option.value class_name ~default:"_") in
        if p.nullable || p.param_type.nullable then
            (class_type ^ " option")
        else
            class_type
  | _ ->
      (* Regular type *)
      let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
      Option.value (Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:gir_type) ~default:"_"


let generate_method_wrappers ~ctx ~property_method_names:_ ~property_base_names:_ ~module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods (meth : gir_method) =
  (* Check if any parameter is an interface type - we can't handle these yet *)
  let has_interface_param = Filtering.method_has_interface_param ~ctx meth in
  (* Check if any parameter or return type references cross-namespace enums/bitfields *)
  let has_cross_namespace_type = Filtering.method_has_cross_namespace_types ~ctx meth in
  let should_skip =
    Filtering.should_skip_method_binding ~ctx  meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut) ||
    has_interface_param ||
    has_cross_namespace_type
  in
  if should_skip then ("", seen)
  else
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    let ocaml_function_name = Utils.ocaml_function_name ~class_name ~c_type meth.method_name in
    if StringSet.mem ocaml_name seen then ("", seen)
    else if StringSet.mem ocaml_name conflicting_methods then
      (* Comment out conflicting methods in implementation too *)
      let seen = StringSet.add ocaml_name seen in
      (sprintf "  (* method %s = ... *) (* CONFLICT: incompatible signature with parent method *)\n" ocaml_name, seen)
    else
    let seen = StringSet.add ocaml_name seen in

    (* Check for hierarchy parameters *)
    let param_info = List.map meth.parameters ~f:(fun p ->
      (Utils.ocaml_parameter_name p.param_name, p, get_param_hierarchy_info ~ctx p)
    ) in

    (* Track polymorphic parameter index for unique type variables *)
    let poly_param_counter = ref 0 in
    let get_next_type_var () =
      poly_param_counter := !poly_param_counter + 1;
      sprintf "'p%d" !poly_param_counter
    in

    let param_types =
      List.map param_info ~f:(fun (_, p, hier_opt) ->
        match hier_opt with
        | Some _  ->
            (* class or interface type - check if same cluster *)
            if is_same_cluster_class ~same_cluster_classes p.param_type.name then
              (* Use structural type for same-cluster classes *)
              let structural = structural_type_for_class ~ctx p.param_type.name in
              let type_var = get_next_type_var () in
              let class_type = sprintf "(%s as %s)" structural type_var in
              if p.nullable || p.param_type.nullable then
                Some (class_type ^ " option")
              else
                Some class_type
            else
              (* Use class type for different-cluster classes *)
              let class_name = (Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:p.param_type) in
              let type_var = get_next_type_var () in
              let class_type = sprintf "(#%s as %s)" (Option.value class_name ~default:"_") type_var in
              if p.nullable || p.param_type.nullable then
                Some (class_type ^ " option")
              else
                Some class_type
        | _ ->
            (* Regular type *)

            let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
            let type_mapping = (Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:gir_type) in type_mapping
        )
    in
    let return_type =
      if String.lowercase_ascii meth.return_type.name = "void" then Some "unit"
      else Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:meth.return_type
    in
    let ret_wrapper =
      match Type_resolution.resolve_layer2_class_ref ~ctx ~current_layer2_module ~gir_type:meth.return_type with
      | Some class_ref ->
        if (meth.throws && meth.return_type.nullable) then
          sprintf "Result.map (fun ret -> Option.map (fun ret -> new %s ret) ret)" class_ref
        (* Check if method throws (returns result type) *)
        else if meth.throws then
          (* Result type with class wrapping: Result.map (fun ret -> new ClassName ret) *)
          sprintf "Result.map (fun ret -> new %s ret)" class_ref
        else if meth.return_type.nullable then
          (* Optional type with class wrapping: Option.map (fun ret -> new ClassName ret) *)
          sprintf "Option.map (fun ret -> new %s ret) " class_ref
        else
          (* Non-optional, non-result type: new ClassName *)
          sprintf "new  %s" class_ref
      | _ -> ""
    in


    (* Convert #Module.class_type to partial object type for .ml files *)
    let convert_to_partial_object_type type_str =
      (* Convert #GExpression.expression to (#GExpression.expression as 'p1) for explicit polymorphism *)
      (* For same-cluster classes, structural types are already in correct format *)
      (* We keep the # syntax but add 'as 'pN' to make the type variable explicit *)
      let _, result = List.fold_left param_info ~init:(0, type_str) ~f:(fun (idx, acc) (_, p, hier_opt) ->
        match hier_opt with
        | Some _  ->
            let idx = idx + 1 in
            (* Skip if same cluster - structural type already correct *)
            if is_same_cluster_class ~same_cluster_classes p.param_type.name then
              (idx, acc)
            else
              (* let class_type = hierarchy_class_type ~current_layer2_module hier in *)
              let class_name = (Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:p.param_type) in
              let class_type = "#"^ (Option.value class_name ~default:"_") in
              let class_type_pattern = class_type in
              let pattern_option = class_type_pattern ^ " option" in
              let type_var = sprintf "'p%d" idx in
              let partial_option = sprintf "(%s as %s) option" class_type type_var in
              (* Replace with 'as 'pN' for option types, keep as-is for non-option *)
              let new_acc = acc |> Str.global_replace (Str.regexp_string pattern_option) partial_option in
              (idx, new_acc)
        | _ -> (idx, acc))
      in
      result
    in

    let type_annotation =
      let param_types_clean = List.filter_map param_types ~f:(fun x -> x) in
      let ret = return_type |> Option.value ~default:"unit" in
      let final_ret =
        if meth.throws then sprintf "(%s, GError.t) result" ret
        else ret
      in
      let param_types_clean = if param_types_clean = [] then ["unit"] else param_types_clean in
      (* Check for # object types or < structural types BEFORE conversion *)
      let has_type_var = List.exists (param_types_clean @ [final_ret]) ~f:has_type_variable in
      let has_object_type = List.exists (param_types_clean @ [final_ret]) ~f:(fun t -> String.contains t '#' || String.contains t '<') in
      let signature = String.concat ~sep:" -> " (param_types_clean @ [final_ret]) in
      (* Convert # syntax to partial object types for .ml files *)
      let signature = convert_to_partial_object_type signature in
      (* Add explicit polymorphism if we have type variables OR # object types OR structural types *)
      if has_type_var || has_object_type then
        (* Generate type variable list: 'p1 'p2 'p3 ... *)
        let num_poly_params = !poly_param_counter in
        let type_vars =
          if num_poly_params > 0 then
            let vars = List.init ~len:num_poly_params ~f:(fun i -> sprintf "'p%d" (i + 1)) in
            String.concat ~sep:" " vars ^ ". "
          else
            "'a. "
        in
         (sprintf "%s%s" type_vars signature)
      else
         signature
    in

    let buf = Buffer.create 256 in

    (* Helper to generate method header with optional type annotation *)
    let generate_method_header param_list =
      bprintf buf "  method %s : %s =\n    fun %s ->\n" ocaml_name type_annotation param_list
    in

    (* if has_hierarchy_params then begin *)
      (* Generate method with hierarchy parameter coercion *)
      let param_names = List.map param_info ~f:(fun (name, _, _) -> name) in
      let param_list = if param_names = [] then "()" else String.concat ~sep:" " param_names in

      generate_method_header param_list;

      (* For hierarchy params with type annotations, we need let bindings *)
      (* Generate let bindings for all hierarchy parameters *)
      List.iter param_info ~f:(fun (name, p, hier_opt) ->
        match hier_opt with
        | Some _hier ->
            (* Use class-specific accessor, not hierarchy accessor *)
            let accessor =
              match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
              | Some { layer2_class = Some layer2_class; _ } -> layer2_class.class_layer1_accessor
              | _ ->
                  (* Fallback to class-specific accessor based on class name *)
                  "as_" ^ (Utils.ocaml_class_name p.param_type.name)
            in
            if p.nullable || p.param_type.nullable then
              bprintf buf "      let %s = Option.map (fun (c) -> c#%s) %s in\n"
                name accessor name
            else
              bprintf buf "      let %s = %s#%s in\n"
                name name accessor
        | _ -> ()
      );
      bprintf buf "      %s(%s.%s obj" ret_wrapper module_name ocaml_function_name;


      List.iter param_info ~f:(fun (name, p, hier_opt) ->
        match hier_opt with
        | Some _hier ->
            (* Use class-specific accessor, not hierarchy accessor *)
            (* let accessor =
              match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
              | Some { layer2_class = Some layer2_class; _ } -> layer2_class.class_layer1_accessor
              | _ ->
                  (* Fallback to class-specific accessor based on class name *)
                  "as_" ^ (Utils.ocaml_class_name p.param_type.name)
            in *)
            if p.nullable || p.param_type.nullable then

                bprintf buf " %s" name

            else

                bprintf buf " %s" name

        | _ ->
            bprintf buf " %s" name
      );
      bprintf buf ")\n";
    (Buffer.contents buf, seen)


let generate_method_signatures ~ctx ~property_method_names:_ ~property_base_names:_ ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods (meth : gir_method) =
  (* Check if any parameter is an interface type - we can't handle these yet *)
  let has_interface_param = Filtering.method_has_interface_param ~ctx meth in
  (* Check if any parameter or return type references cross-namespace enums/bitfields *)
  let has_cross_namespace_type = Filtering.method_has_cross_namespace_types ~ctx meth in
  let should_skip =
    Filtering.should_skip_method_binding ~ctx  meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut) ||
    has_interface_param ||
    has_cross_namespace_type
  in
  if should_skip then ("", seen)
  else
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    if StringSet.mem ocaml_name seen then ("", seen)
    else if StringSet.mem ocaml_name conflicting_methods then
      (* Comment out conflicting methods *)
      let seen = StringSet.add ocaml_name seen in
      (sprintf "    (* method %s : ... *) (* CONFLICT: incompatible signature with parent method *)\n" ocaml_name, seen)
    else

    let param_types =
      List.map ~f:(fun p ->
        map_param_sig ~ctx ~same_cluster_classes ~current_layer2_module p) meth.parameters
    in
    (* if List.exists param_types ~f:(fun x -> x = None) then ("", seen) else *)
    (* let param_types = List.filter_map param_types ~f:(fun x -> x) in *)
    let return_type =
      (if String.lowercase_ascii meth.return_type.name = "void" then Some "unit"
      else Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:meth.return_type)
      |> Option.value ~default:"unit"
    in
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