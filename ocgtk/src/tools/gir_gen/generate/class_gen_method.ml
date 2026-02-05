(* Method generation code for class generation *)

[@@@warning "-32-33"]
open StdLabels
open Printf
open Types

(* Use Class_gen_helpers for shared functions
   Note: open StdLabels is needed here despite Class_gen_helpers having it,
   because opens don't propagate through include *)
include Class_gen_helpers

(* Helper: Require a type from Option, fail with descriptive error *)
let require_type ~location ~gir_type_name (type_opt : string option) : string =
  match type_opt with
  | Some t -> t
  | None -> failwith (sprintf "Gir_gen.class_gen_method: %s: unresolved type %s" location gir_type_name)

(* Helper: Build type for same-cluster class parameter *)
let build_same_cluster_type ~ctx ~name ~is_nullable =
  let structural = structural_type_for_class ~ctx name in
  if is_nullable then structural ^ " option" else structural

(* Helper: Build type for hierarchy class parameter *)
let build_hierarchy_type ~ctx ~current_layer2_module ~gir_type ~is_nullable =
  let class_name_opt = Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:gir_type in
  let class_name = require_type ~location:"map_param_sig.hierarchy" ~gir_type_name:gir_type.name class_name_opt in
  let class_type = "#" ^ class_name in
  if is_nullable then class_type ^ " option" else class_type

(* Helper: Build base type with optional handling *)
let build_base_type ~is_nullable class_type =
  if is_nullable then Some (class_type ^ " option") else Some class_type

(* Helper: Build parameter type for hierarchy class parameter *)
let build_param_type_with_hierarchy ~ctx ~same_cluster_classes ~current_layer2_module p =
  let hier_opt = get_param_hierarchy_info ~ctx p in
  let is_nullable = p.nullable || p.param_type.nullable in
  match hier_opt with
  | Some _ ->
      let is_same_cluster = is_same_cluster_class ~same_cluster_classes p.param_type.name in
      if is_same_cluster then
        build_same_cluster_type ~ctx ~name:p.param_type.name ~is_nullable
      else
        build_hierarchy_type ~ctx ~current_layer2_module ~gir_type:p.param_type ~is_nullable
  | None ->
      let gir_type = { p.param_type with nullable = is_nullable } in
      let type_opt = Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:gir_type in
      require_type ~location:"map_param_sig.regular" ~gir_type_name:gir_type.name type_opt

(* Map parameter to type signature string *)
let map_param_sig ~ctx ~same_cluster_classes ~current_layer2_module p =
  build_param_type_with_hierarchy ~ctx ~same_cluster_classes ~current_layer2_module p

(* Helper: Build class type string for hierarchy parameters *)
let build_class_type ~ctx ~current_layer2_module ~same_cluster_classes p idx =
  let same_cluster = is_same_cluster_class ~same_cluster_classes p.param_type.name in
  let type_var = sprintf "'p%d" (idx + 1) in
  if same_cluster then
    let structural = structural_type_for_class ~ctx p.param_type.name in
    sprintf "(%s as %s)" structural type_var
  else
    let class_name_opt = Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:p.param_type in
    let class_name = require_type ~location:"build_class_type.hierarchy" ~gir_type_name:p.param_type.name class_name_opt in
    sprintf "(#%s as %s)" class_name type_var

(* Helper: Build parameter type string for a single parameter *)
let build_param_type ~ctx ~same_cluster_classes ~current_layer2_module (types, idx) (_, p, hier_opt) =
  match hier_opt with
  | Some _ ->
      let class_type = build_class_type ~ctx ~current_layer2_module ~same_cluster_classes p idx in
      let is_nullable = p.nullable || p.param_type.nullable in
      let base_type = build_base_type ~is_nullable class_type in
      (types @ [base_type], idx + 1)
  | _ ->
      let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
      let type_mapping = Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:gir_type in
      (types @ [type_mapping], idx)

(* Helper: Convert a single parameter's class type in the type string *)
let convert_param_in_string ~ctx ~current_layer2_module ~same_cluster_classes idx acc (p : Types.gir_param) =
  let is_same = is_same_cluster_class ~same_cluster_classes p.param_type.name in
  let idx = idx + 1 in
  if not is_same then
    let class_name_opt = Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:p.param_type in
    let class_name = require_type ~location:"convert_param_in_string.hierarchy" ~gir_type_name:p.param_type.name class_name_opt in
    let class_type = "#" ^ class_name in
    let pattern_option = class_type ^ " option" in
    let type_var = sprintf "'p%d" idx in
    let partial_option = sprintf "(%s as %s) option" class_type type_var in
    try
      let new_acc = Str.global_replace (Str.regexp_string pattern_option) partial_option acc in
      (idx, new_acc)
    with
    | Not_found ->
        (* Pattern not found in string, return original *)
        (idx, acc)
  else
    (idx, acc)

(* Helper: Convert parameter type in string with hierarchy check *)
let convert_param_type_in_string ~ctx ~current_layer2_module ~same_cluster_classes (idx, acc) (_, p, hier_opt) =
  match hier_opt with
  | Some _ -> convert_param_in_string ~ctx ~current_layer2_module ~same_cluster_classes idx acc p
  | _ -> (idx, acc)

(* Helper: Find accessor name for a hierarchy parameter *)
let find_accessor_name ~ctx p =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type with
  | Some { layer2_class = Some layer2_class; _ } -> layer2_class.class_layer1_accessor
  | _ ->
      (* Fallback to class-specific accessor based on class name *)
      "as_" ^ (Utils.ocaml_class_name p.param_type.name)

(* Helper: Generate let binding for hierarchy parameter *)
let generate_hierarchy_param_binding buf name p accessor =
  if p.nullable || p.param_type.nullable then
    bprintf buf "      let %s = Option.map (fun (c) -> c#%s) %s in\n"
      name accessor name
  else
    bprintf buf "      let %s = %s#%s in\n"
      name name accessor


let generate_method_wrappers ~ctx ~property_method_names:_ ~property_base_names:_ ~module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods (meth : gir_method) =
  (* Determine if method should be skipped *)
  let should_skip = should_skip_method ~ctx meth in
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

    (* Track polymorphic parameter index for unique type variables using fold accumulator *)
    let (param_types, poly_param_counter) =
      List.fold_left param_info ~init:([], 0) ~f:(build_param_type ~ctx ~same_cluster_classes ~current_layer2_module)
    in
    let return_type =
      let name = String.lowercase_ascii meth.return_type.name in
      if name = "void" || name = "none" then Some "unit"
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
      let (_, result) =
        List.fold_left param_info ~init:(0, type_str) ~f:(convert_param_type_in_string ~ctx ~current_layer2_module ~same_cluster_classes)
      in
      result
    in

    let type_annotation =
      let param_types_clean = List.filter_map param_types ~f:Fun.id in
      let ret =
        match return_type with
        | Some t -> t
        | None -> failwith (sprintf "Unable to resolve return type for method %s" meth.method_name)
      in
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
        let num_poly_params = poly_param_counter in
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

      List.iter param_info ~f:(fun (name, _, _) ->
        bprintf buf " %s" name
      );
      bprintf buf ")\n";
    (Buffer.contents buf, seen)


(* Generate method signature content from parameters and return type *)
let generate_signature_content ~ctx ~same_cluster_classes ~current_layer2_module (meth : Types.gir_method) =
  let param_types =
    List.map ~f:(fun p ->
      map_param_sig ~ctx ~same_cluster_classes ~current_layer2_module p) meth.parameters
  in
  let return_type =
    let name = String.lowercase_ascii meth.return_type.name in
    let result = if name = "void" || name = "none" then Some "unit"
    else Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:meth.return_type in
    match result with
    | Some t -> t
    | None -> failwith (sprintf "Unable to resolve return type for method %s" meth.method_name)
  in
  let final_return_type =
    if meth.throws then sprintf "(%s, GError.t) result" return_type
    else return_type
  in
  let param_types = if param_types = [] then ["unit"] else param_types in
  let has_type_var = List.exists (param_types @ [final_return_type]) ~f:has_type_variable in
  let signature = String.concat ~sep:" -> " (param_types @ [final_return_type]) in
  (has_type_var, signature)

let generate_method_signatures ~ctx ~property_method_names:_ ~property_base_names:_ ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods (meth : gir_method) =
  (* Determine if method should be skipped *)
  let should_skip = should_skip_method ~ctx meth in
  let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
  let is_duplicate = StringSet.mem ocaml_name seen in
  let is_conflict = StringSet.mem ocaml_name conflicting_methods in

  if should_skip || is_duplicate then ("", seen)
  else if is_conflict then
    let seen = StringSet.add ocaml_name seen in
    (sprintf "    (* method %s : ... *) (* CONFLICT: incompatible signature with parent method *)\n" ocaml_name, seen)
  else
    let (has_type_var, signature) = generate_signature_content ~ctx ~same_cluster_classes ~current_layer2_module meth in
    let seen = StringSet.add ocaml_name seen in
    let buf = Buffer.create 256 in
    if has_type_var then
      bprintf buf "    method %s : 'a. %s\n" ocaml_name signature
    else
      bprintf buf "    method %s : %s\n" ocaml_name signature;
    (Buffer.contents buf, seen)