(* High-level class generation (Step 3) *)

[@@@warning "-32"]

open StdLabels
open Printf
open Types

module StringSet = Set.Make(String)

(* Helper types and functions *)

type module_names = {
  layer1: string;
  layer2: string;
}

type property_filters = {
  method_names: string list;
  base_names: string list;
}

let sanitize_name s =
  s |> String.map ~f:(function '-' -> '_' | c -> c) |> Utils.to_snake_case |> Utils.sanitize_identifier

let signal_class_name class_name = Utils.ocaml_class_name (
  sanitize_name class_name ^ "_signals")

let get_signal_module_name class_snake = "G" ^ class_snake ^ "_signals"

let get_module_names ~ctx class_name =
  let layer1 = Class_utils.get_qualified_module_name ~ctx class_name in
  { layer1; layer2 = "G" ^ layer1 }

let get_property_filters ~ctx properties = {
  method_names = Filtering.property_method_names ~ctx properties;
  base_names = Filtering.property_base_names ~ctx properties;
}

(* Helper to check if a class name is in the same cluster *)
let is_same_cluster_class ~same_cluster_classes class_name =
  List.mem class_name ~set:same_cluster_classes

(* Helper to generate structural type for same-cluster class references *)
let structural_type_for_class ~ctx class_name =
  let layer1_module = Class_utils.get_qualified_module_name ~ctx class_name in
  let accessor = "as_" ^ (Utils.ocaml_class_name class_name) in
  sprintf "<%s: %s.t; ..>" accessor layer1_module

let ocaml_method_name ~class_name ~c_type (meth : gir_method) =
  Utils.ocaml_method_name ~class_name ~c_type meth.method_name |> sanitize_name

(* Helper to get method signature for comparison *)
let method_signature_for_comparison (meth : gir_method) : string =
  (* Create a comparable signature from parameter types *)
  let param_sig =
    List.map meth.parameters ~f:(fun p -> p.param_type.name)
    |> String.concat ~sep:","
  in
  sprintf "%s(%s)->%s" meth.method_name param_sig meth.return_type.name

(* Get all methods from a class *)
let get_class_methods ~ctx class_name : gir_method list =
  match List.find_opt ~f:(fun cls -> cls.class_name = class_name) ctx.classes with
  | Some cls -> cls.methods
  | None -> []

(* Build parent chain for a class *)
let rec build_parent_chain ~ctx class_name : string list =
  match List.find_opt ~f:(fun cls -> cls.class_name = class_name) ctx.classes with
  | None -> []
  | Some cls ->
      match cls.parent with
      | None -> []
      | Some parent -> parent :: build_parent_chain ~ctx parent

(* Get all methods from parent chain *)
let get_parent_methods ~ctx ~parent_chain : (string * gir_method) list =
  List.concat_map parent_chain ~f:(fun parent_name ->
    let methods = get_class_methods ~ctx parent_name in
    List.map methods ~f:(fun meth -> (parent_name, meth))
  )

(* Check if two methods have conflicting signatures *)
let methods_have_signature_conflict ~ctx:_ ~class_name ~c_type meth1 meth2 =
  let name1 = ocaml_method_name ~class_name ~c_type meth1 in
  let name2 = ocaml_method_name ~class_name ~c_type meth2 in

  (* Same name but different signatures *)
  if String.equal name1 name2 then
    let sig1 = method_signature_for_comparison meth1 in
    let sig2 = method_signature_for_comparison meth2 in
    not (String.equal sig1 sig2)
  else
    false

(* Detect which methods conflict with parent methods *)
let detect_method_conflicts ~ctx ~class_name ~c_type ~methods : StringSet.t =
  let parent_chain = build_parent_chain ~ctx class_name in
  let parent_methods = get_parent_methods ~ctx ~parent_chain in

  let conflicts = ref StringSet.empty in

  List.iter methods ~f:(fun child_meth ->
    List.iter parent_methods ~f:(fun (_parent_name, parent_meth) ->
      if methods_have_signature_conflict ~ctx ~class_name ~c_type child_meth parent_meth then
        let ocaml_name = ocaml_method_name ~class_name ~c_type child_meth in
        conflicts := StringSet.add ocaml_name !conflicts
    )
  );

  !conflicts

(* Check if a parameter is a hierarchy type and get its info *)
let get_param_hierarchy_info ~ctx (param : gir_param) : hierarchy_info option =
  Hierarchy_detection.get_hierarchy_info ctx param.param_type.name

let resolve_layer2_class ~ctx ~current_layer2_module (gir_type:gir_type) =
  match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some { layer2_class = Some layer2_class; _ } ->
    Some (if String.equal current_layer2_module layer2_class.class_module then layer2_class.class_type 
      else layer2_class.class_module ^ "." ^ layer2_class.class_type) 
  | _ -> None

let ocaml_type_of_gir_type ~ctx ~current_layer2_module (gir_type : gir_type) =
  (match Type_mappings.find_type_mapping_for_gir_type ~ctx gir_type with
  | Some { layer2_class = Some layer2_class; _ } ->
    Some (if String.equal current_layer2_module layer2_class.class_module then layer2_class.class_type
      else layer2_class.class_module ^ "." ^ layer2_class.class_type)
  | Some mapping ->
      Some (Type_mappings.qualify_ocaml_type ~gir_type_name:(Some gir_type.name) mapping.ocaml_type)
  | None -> None)
  |> Option.map (fun base -> if gir_type.nullable then base ^ " option" else base)

(* Generic property code generation - refactoring #6 *)
let generate_property_code ~ctx ~seen ~generate_getter ~generate_setter (prop : gir_property) =
  if not (Filtering.should_generate_property ~ctx prop) then ("", seen)
  else
    let prop_snake = Utils.ocaml_property_name prop.prop_name in
    if StringSet.mem prop_snake seen then ("", seen) else
    let seen = StringSet.add prop_snake seen in
    let buf = Buffer.create 128 in

    if prop.readable then begin
      let code = generate_getter prop prop_snake in
      Buffer.add_string buf code;
    end;

    if prop.writable && not prop.construct_only then begin
      let code = generate_setter prop prop_snake in
      Buffer.add_string buf code;
    end;

    let seen =
      if prop.writable && not prop.construct_only then StringSet.add ("set_" ^ prop_snake) seen
      else seen
    in
    (Buffer.contents buf, seen)

let generate_property_methods ~ctx ~module_name ~current_layer2_module ~seen ~same_cluster_classes (prop : gir_property) =
  let generate_getter _prop prop_snake =
    let method_name = prop_snake |> Utils.sanitize_identifier in
    let impl = match resolve_layer2_class ~ctx ~current_layer2_module prop.prop_type with
      | Some class_ref ->
        if prop.prop_type.nullable then
          sprintf "(%s.get_%s obj) |> Option.map (fun x -> new %s x)" module_name prop_snake class_ref
        else
          sprintf "new %s (%s.get_%s obj)" class_ref module_name prop_snake
      | _ -> sprintf "%s.get_%s obj" module_name prop_snake
    in
    sprintf "  method %s = %s\n" method_name impl
  in
  let generate_setter _prop prop_snake =
    let method_name = "set_"^prop_snake |> Utils.sanitize_identifier in
    let impl = if prop.prop_type.nullable then
      sprintf "match v with | Some v -> %s.set_%s obj v | None -> %s.set_%s obj None" module_name prop_snake module_name prop_snake
    else
      sprintf "%s.set_%s obj v" module_name prop_snake
    in
    sprintf "  method %s v = %s\n" method_name impl
  in
  let _ = same_cluster_classes in (* Will be used in type annotations if needed *)
  generate_property_code ~ctx ~seen ~generate_getter ~generate_setter prop

let has_type_variable type_str =
  (* Check if the type contains an type-variable wildcard (like "_ Gdk.event") *)
  
  let parts = Str.split (Str.regexp "[ \t]+") type_str in
  List.exists ~f:(fun part -> part = "'a") parts

let generate_property_signatures ~ctx ~seen ~current_layer2_module ~same_cluster_classes (prop : gir_property) =
  match ocaml_type_of_gir_type ~ctx ~current_layer2_module prop.prop_type with
  | None -> ("", seen)
  | Some ocaml_type ->
      (* Check if this is a same-cluster class reference and convert to structural type *)
      let ocaml_type =
        if is_same_cluster_class ~same_cluster_classes prop.prop_type.name then
          let structural = structural_type_for_class ~ctx prop.prop_type.name in
          if prop.prop_type.nullable then structural ^ " option" else structural
        else ocaml_type
      in
      let generate_getter _prop prop_snake =
        let method_name = prop_snake |> Utils.sanitize_identifier in
        sprintf "    method %s : %s\n" method_name ocaml_type
      in
      let generate_setter _prop prop_snake =
        let method_name = "set_"^prop_snake |> Utils.sanitize_identifier in
        sprintf "    method %s : %s -> unit\n" method_name ocaml_type
      in
      generate_property_code ~ctx ~seen ~generate_getter ~generate_setter prop

let generate_method_wrappers ~ctx ~property_method_names ~property_base_names ~module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods (meth : gir_method) =
  let should_skip =
    Filtering.should_skip_method_binding ~ctx ~property_method_names ~property_base_names ~class_name ~c_type meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut)
  in
  if should_skip then ("", seen)
  else
    let ocaml_name = ocaml_method_name ~class_name ~c_type meth in
    let ocaml_function_name = Utils.ocaml_function_name ~class_name ~c_type meth.c_identifier in
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
    let has_hierarchy_params = List.exists param_info ~f:(fun (_, _, hier_opt) ->
      match hier_opt with
      | Some info -> info.hierarchy <> MonomorphicType
      | None -> false
    ) in

    (* Build type signature for the method (needed for type annotation) *)
    let param_hier_info = List.map meth.parameters ~f:(fun p ->
      (p, get_param_hierarchy_info ~ctx p)
    ) in

    (* Track polymorphic parameter index for unique type variables *)
    let poly_param_counter = ref 0 in
    let get_next_type_var () =
      poly_param_counter := !poly_param_counter + 1;
      sprintf "'p%d" !poly_param_counter
    in

    let param_types =
      List.map param_hier_info ~f:(fun (p, hier_opt) ->
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
              let class_name = (ocaml_type_of_gir_type ~ctx ~current_layer2_module p.param_type) in
              let type_var = get_next_type_var () in
              let class_type = sprintf "(#%s as %s)" (Option.get class_name) type_var in
              if p.nullable || p.param_type.nullable then
                Some (class_type ^ " option")
              else
                Some class_type
        | _ ->
            (* Regular type *)

            let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
            let type_mapping = (ocaml_type_of_gir_type ~ctx ~current_layer2_module gir_type) in type_mapping
        )
    in
    let return_type =
      if String.lowercase_ascii meth.return_type.c_type = "void" then Some "unit"
      else ocaml_type_of_gir_type ~ctx ~current_layer2_module meth.return_type
    in
    let ret_wrapper = match resolve_layer2_class ~ctx ~current_layer2_module meth.return_type with 
      | Some class_ref ->
        begin match meth.return_type.nullable with
        | true -> sprintf "Option.map (fun ret -> new %s ret) " class_ref
        | false -> sprintf "new  %s" class_ref
      end
      | _ -> "" in


    (* Convert #Module.class_type to partial object type for .ml files *)
    let convert_to_partial_object_type type_str =
      (* Convert #GExpression.expression to (#GExpression.expression as 'p1) for explicit polymorphism *)
      (* For same-cluster classes, structural types are already in correct format *)
      (* We keep the # syntax but add 'as 'pN' to make the type variable explicit *)
      let _, result = List.fold_left param_hier_info ~init:(0, type_str) ~f:(fun (idx, acc) (p, hier_opt) ->
        match hier_opt with
        | Some hier when hier.hierarchy <> MonomorphicType ->
            let idx = idx + 1 in
            (* Skip if same cluster - structural type already correct *)
            if is_same_cluster_class ~same_cluster_classes p.param_type.name then
              (idx, acc)
            else
              (* let class_type = hierarchy_class_type ~current_layer2_module hier in *)
              let class_name = (ocaml_type_of_gir_type ~ctx ~current_layer2_module p.param_type) in
              let class_type = "#"^ (Option.get class_name) in
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

    let type_annotation_opt =
      (* if needs_type_annotation then *)
        match return_type with
        | Some ret when not (List.exists param_types ~f:(fun x -> x = None)) ->
            let param_types_clean = List.filter_map param_types ~f:(fun x -> x) in
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
              Some (sprintf "%s%s" type_vars signature)
            else
              Some signature
        | _ -> None
      (* else None *)
    in

    let buf = Buffer.create 256 in

    (* Helper to generate method header with optional type annotation *)
    let generate_method_header param_list =
      match type_annotation_opt with
      | Some type_ann ->
          bprintf buf "  method %s : %s =\n    fun %s ->\n" ocaml_name type_ann param_list
      | None ->
          bprintf buf "  method %s %s =\n" ocaml_name param_list
    in

    if has_hierarchy_params then begin
      (* Generate method with hierarchy parameter coercion *)
      let param_names = List.map param_info ~f:(fun (name, _, _) -> name) in
      let param_list = if param_names = [] then "()" else String.concat ~sep:" " param_names in

      generate_method_header param_list;

      (* For hierarchy params with type annotations, we need let bindings *)
      let has_hierarchy_with_annotation = type_annotation_opt <> None && has_hierarchy_params in

      if has_hierarchy_with_annotation then begin
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
        bprintf buf "      %s(%s.%s obj" ret_wrapper module_name ocaml_function_name
      end else begin
        bprintf buf "    %s(%s.%s obj" ret_wrapper module_name ocaml_function_name
      end;

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
              if has_hierarchy_with_annotation then
                bprintf buf " %s" name
              else
                bprintf buf " (Option.map (fun c -> (c#%s )) %s)" accessor name
            else
              if has_hierarchy_with_annotation then
                bprintf buf " %s" name
              else
                bprintf buf " (%s#%s )" name accessor
        | _ ->
            bprintf buf " %s" name
      );
      bprintf buf ")\n"
    end else begin
      (* Regular method without hierarchy parameters *)
      let method_params = List.map meth.parameters ~f:(fun p -> Utils.ocaml_parameter_name p.param_name) in
      let layer1_params = List.map meth.parameters ~f:(fun p ->
        let p_name = Utils.ocaml_parameter_name p.param_name in
        let tm = Type_mappings.find_type_mapping_for_gir_type ~ctx p.param_type in
        match tm with
        | Some ({ layer2_class = Some layer2_class; _ } ) ->
            if p.param_type.nullable || p.nullable then
              sprintf "( %s |> Option.map (fun x -> x#%s) )" p_name layer2_class.class_layer1_accessor
            else
              sprintf "( %s#%s )" p_name layer2_class.class_layer1_accessor
        | _ -> p_name
      ) |> String.concat ~sep:" " in

      let param_list = if method_params = [] then "()" else String.concat ~sep:" " method_params in

      match type_annotation_opt with
      | Some type_ann ->
          bprintf buf "  method %s : %s = fun %s -> %s(%s.%s obj %s)\n"
            ocaml_name type_ann param_list ret_wrapper module_name ocaml_function_name layer1_params
      | None ->
          bprintf buf "  method %s %s = %s(%s.%s obj %s)\n"
            ocaml_name param_list ret_wrapper module_name ocaml_function_name layer1_params
    end;

    (Buffer.contents buf, seen)

let generate_method_signatures ~ctx ~property_method_names ~property_base_names ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods (meth : gir_method) =
  let should_skip =
    Filtering.should_skip_method_binding ~ctx ~property_method_names ~property_base_names ~class_name ~c_type meth ||
    List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut)
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

    (* Check for hierarchy parameters *)
    let param_hier_info = List.map meth.parameters ~f:(fun p ->
      (p, get_param_hierarchy_info ~ctx p)
    ) in

    let param_types =
      List.map param_hier_info ~f:(fun (p, hier_opt) ->
        match hier_opt with
        | Some _  ->
            (* Check if same cluster - use structural type *)
            if is_same_cluster_class ~same_cluster_classes p.param_type.name then
              let structural = structural_type_for_class ~ctx p.param_type.name in
              if p.nullable || p.param_type.nullable then
                Some (structural ^ " option")
              else
                Some structural
            else
              (* Use # syntax for hierarchy types *)
              (* let class_type = hierarchy_class_type ~current_layer2_module hier in *)
              let class_name = (ocaml_type_of_gir_type ~ctx ~current_layer2_module p.param_type) in
              let class_type = "#"^ (Option.get class_name) in
              if p.nullable || p.param_type.nullable then
                Some (class_type ^ " option")
              else
                Some class_type
        | _ ->
            (* Regular type *)
            let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
            ocaml_type_of_gir_type ~ctx ~current_layer2_module gir_type)
    in
    if List.exists param_types ~f:(fun x -> x = None) then ("", seen) else
    let param_types = List.filter_map param_types ~f:(fun x -> x) in
    let return_type =
      if String.lowercase_ascii meth.return_type.c_type = "void" then Some "unit"
      else ocaml_type_of_gir_type ~ctx ~current_layer2_module meth.return_type
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

let generate_hierarchy_converter_method_impl ~ctx ~(hierarchy_info : hierarchy_info) ~class_name buf =
  if String.equal class_name (hierarchy_info.gir_root) then
    (* bprintf buf "  method %s = obj\n"  hierarchy_info.accessor_method  *)
    ()
  else

  bprintf buf "  method %s = (%s.%s obj)\n"  hierarchy_info.accessor_method (Class_utils.get_qualified_module_name ~ctx class_name) hierarchy_info.accessor_method

let generate_hierarchy_converter_method_sig ~hierarchy_info ~class_name buf =
  if String.equal class_name (hierarchy_info.gir_root) then
    ()
  else
    bprintf buf "  method %s : %s\n" hierarchy_info.accessor_method hierarchy_info.layer1_base_type

let generate_class_converter_method_sig ~ctx ~class_name buf = bprintf buf "    method as_%s : %s.t\n" (Utils.ocaml_class_name class_name) (Class_utils.get_qualified_module_name ~ctx class_name)
let generate_class_converter_method_impl ~class_name buf = bprintf buf "    method as_%s = obj\n" (Utils.ocaml_class_name class_name)

(* Shared class module body generation - refactoring #1 *)
let generate_class_module_body ~ctx ~buf ~layer1_module_name ~current_layer2_module ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes () =
  let has_any_signals = List.length signals > 0 in
  let property_filters = get_property_filters ~ctx properties in

  (* Detect method conflicts with parent classes *)
  let conflicting_methods = detect_method_conflicts ~ctx ~class_name ~c_type ~methods in

  (* Inheritance *)
  Option.iter (fun hierarchy_info ->
    if not (String.equal hierarchy_info.gir_root class_name) then
      bprintf buf "  inherit %s.%s (%s.%s obj)\n" hierarchy_info.layer2_module hierarchy_info.class_type_name layer1_module_name hierarchy_info.accessor_method
  ) hierarchy_info;

  (* Signal handlers via inherit *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    bprintf buf "  inherit %s.%s obj\n" signal_module (signal_class_name class_name)
  end;

  bprintf buf "\n";

  (* Properties *)
  let seen = StringSet.empty in
  let seen, () =
    List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
      let chunk, seen = generate_property_methods ~ctx ~module_name:layer1_module_name ~current_layer2_module ~seen ~same_cluster_classes prop in
      Buffer.add_string buf chunk;
      if chunk <> "" then Buffer.add_char buf '\n';
      (seen, ()))
  in

  (* Methods *)
  let seen, () =
    List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) m ->
      let chunk, seen = generate_method_wrappers ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~module_name:layer1_module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods m in
      Buffer.add_string buf chunk;
      if chunk <> "" then Buffer.add_char buf '\n';
      (seen, ()))
  in
  ignore seen;

  (* Converter methods *)
  Option.iter (fun hierarchy_info -> generate_hierarchy_converter_method_impl ~ctx ~class_name ~hierarchy_info buf) hierarchy_info;
  generate_class_converter_method_impl ~class_name buf

(* Shared signature body generation - refactoring #2 *)
let generate_class_signature_body ~ctx ~buf ~layer1_module_name:_ ~current_layer2_module ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes () =
  let has_any_signals = List.length signals > 0 in
  let property_filters = get_property_filters ~ctx properties in

  (* Detect method conflicts with parent classes *)
  let conflicting_methods = detect_method_conflicts ~ctx ~class_name ~c_type ~methods in

  (* Inheritance *)
  Option.iter (fun hierarchy_info ->
    if not (String.equal hierarchy_info.gir_root class_name) then
      bprintf buf "    inherit %s.%s\n" hierarchy_info.layer2_module hierarchy_info.class_type_name
  ) hierarchy_info;

  (* Signal handlers via inherit *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    bprintf buf "    inherit %s.%s\n" signal_module (signal_class_name class_name)
  end;

  (* Properties *)
  let seen = StringSet.empty in
  let seen, () =
    List.fold_left properties ~init:(seen, ()) ~f:(fun (seen, ()) prop ->
      let chunk, seen = generate_property_signatures ~ctx ~seen ~current_layer2_module ~same_cluster_classes prop in
      Buffer.add_string buf chunk;
      (seen, ()))
  in

  (* Methods *)
  let _seen, () =
    List.fold_left methods ~init:(seen, ()) ~f:(fun (seen, ()) meth ->
      let chunk, seen = generate_method_signatures ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes ~conflicting_methods meth in
      Buffer.add_string buf chunk;
      (seen, ()))
  in

  (* Converter methods *)
  Option.iter (fun hierarchy_info -> generate_hierarchy_converter_method_sig ~hierarchy_info ~class_name buf) hierarchy_info;
  generate_class_converter_method_sig ~ctx ~class_name buf

let generate_class_module ~ctx ~class_name ~c_type ~parent_chain:_ ~methods ~properties ~signals =
  let buf = Buffer.create 2048 in
  let module_names = get_module_names ~ctx class_name in
  let class_snake = sanitize_name class_name in
  let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx class_name in
  let has_any_signals = List.length signals > 0 in

  if has_any_signals then
    bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

  bprintf buf "(* High-level class for %s *)\n" class_name;
  bprintf buf "class %s (obj : %s.t) = object (self)\n" class_snake module_names.layer1;

  (* For standalone classes, no same-cluster classes *)
  generate_class_module_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ();

  bprintf buf "end\n\n";
  Buffer.contents buf

let generate_class_signature ~ctx ~class_name ~c_type ~parent_chain:_ ~methods ~properties ~signals =
  let buf = Buffer.create 1024 in
  let module_names = get_module_names ~ctx class_name in
  let class_snake = sanitize_name class_name in
  let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx class_name in

  bprintf buf "class %s : %s.t ->\n" class_snake module_names.layer1;
  bprintf buf "  object\n";

  (* For standalone classes, no same-cluster classes *)
  generate_class_signature_body ~ctx ~buf
    ~layer1_module_name:module_names.layer1
    ~current_layer2_module:module_names.layer2
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[class_name] ();

  bprintf buf "  end\n\n";
  Buffer.contents buf

(* Generate combined class modules for cyclic dependencies *)
let generate_combined_class_module ~ctx ~combined_module_name ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in
  bprintf buf "(* GENERATED CODE - DO NOT EDIT *)\n";
  bprintf buf "(* Combined classes for cyclic dependencies *)\n\n";

  let current_layer2_module = "G" ^ combined_module_name in
  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in

  (* Extract all class names in this cluster for same-cluster detection *)
  let same_cluster_classes = List.map sorted_entities ~f:(fun e -> e.name) in

  (* Generate each class *)
  List.iteri ~f:(fun i entity ->
    let _parent_chain = parent_chain_for_entity entity.name in
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in
    let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx entity.name in
    let has_any_signals = List.length entity.signals > 0 in

    if has_any_signals then
      bprintf buf "(* Signal class defined in g%s_signals.ml *)\n\n" class_snake;

    (* Class declaration with 'and' for subsequent classes *)
    if i = 0 then
      bprintf buf "class %s (obj : %s.t) = object (self)\n" class_snake module_name
    else
      bprintf buf "\nand %s (obj : %s.t) = object (self)\n" class_snake module_name;

    generate_class_module_body ~ctx ~buf
      ~layer1_module_name:module_name
      ~current_layer2_module
      ~class_name:entity.name ~class_snake ~c_type:entity.c_type
      ~methods:entity.methods ~properties:entity.properties ~signals:entity.signals
      ~hierarchy_info ~same_cluster_classes ();

    bprintf buf "end\n";
  ) sorted_entities;

  Buffer.contents buf

(* Generate combined class signatures for cyclic dependencies *)
let generate_combined_class_signature ~ctx ~combined_module_name ~entities ~parent_chain_for_entity =
  let buf = Buffer.create 4096 in
  let current_layer2_module = "G" ^ combined_module_name in
  let sorted_entities = List.sort ~cmp:(fun e1 e2 -> String.compare e1.name e2.name) entities in

  (* Extract all class names in this cluster for same-cluster detection *)
  let same_cluster_classes = List.map sorted_entities ~f:(fun e -> e.name) in

  (* Generate each class signature *)
  List.iteri ~f:(fun i entity ->
    let _parent_chain = parent_chain_for_entity entity.name in
    let module_name = Class_utils.get_qualified_module_name ~ctx entity.name in
    let class_snake = sanitize_name entity.name in
    let hierarchy_info = Hierarchy_detection.get_hierarchy_info ctx entity.name in

    if i > 0 then bprintf buf "\nand ";
    if i = 0 then bprintf buf "class ";
    bprintf buf "%s : %s.t ->\n" class_snake module_name;
    bprintf buf "  object\n";

    generate_class_signature_body ~ctx ~buf
      ~layer1_module_name:module_name
      ~current_layer2_module
      ~class_name:entity.name ~class_snake ~c_type:entity.c_type
      ~methods:entity.methods ~properties:entity.properties ~signals:entity.signals
      ~hierarchy_info ~same_cluster_classes ();

    bprintf buf "  end\n";
  ) sorted_entities;

  Buffer.contents buf
