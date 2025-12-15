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
    let prop_snake = Utils.ocaml_parameter_name prop.prop_name in
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
    let impl = match resolve_layer2_class ~ctx ~current_layer2_module prop.prop_type with
      | Some class_ref ->
        if prop.prop_type.nullable then
          sprintf "(%s.get_%s obj) |> Option.map (fun x -> new %s x)" module_name prop_snake class_ref
        else
          sprintf "new %s (%s.get_%s obj)" class_ref module_name prop_snake
      | _ -> sprintf "%s.get_%s obj" module_name prop_snake
    in
    sprintf "  method %s = %s\n" prop_snake impl
  in
  let generate_setter _prop prop_snake =
    let impl = if prop.prop_type.nullable then
      sprintf "match v with | Some v -> %s.set_%s obj v | None -> %s.set_%s obj None" module_name prop_snake module_name prop_snake
    else
      sprintf "%s.set_%s obj v" module_name prop_snake
    in
    sprintf "  method set_%s v = %s\n" prop_snake impl
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
        sprintf "    method %s : %s\n" prop_snake ocaml_type
      in
      let generate_setter _prop prop_snake =
        sprintf "    method set_%s : %s -> unit\n" prop_snake ocaml_type
      in
      generate_property_code ~ctx ~seen ~generate_getter ~generate_setter prop

let generate_method_wrappers ~ctx ~property_method_names ~property_base_names ~module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes (meth : gir_method) =
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
    let param_types =
      List.map param_hier_info ~f:(fun (p, hier_opt) ->
        match hier_opt with
        | Some _  ->
            (* class or interface type - check if same cluster *)
            if is_same_cluster_class ~same_cluster_classes p.param_type.name then
              (* Use structural type for same-cluster classes *)
              let structural = structural_type_for_class ~ctx p.param_type.name in
              let class_type = sprintf "(%s as 'a)" structural in
              if p.nullable || p.param_type.nullable then
                Some (class_type ^ " option")
              else
                Some class_type
            else
              (* Use class type for different-cluster classes *)
              let class_name = (ocaml_type_of_gir_type ~ctx ~current_layer2_module p.param_type) in
              let class_type = sprintf "(#%s as 'a)" (Option.get class_name) in
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
      (* Convert #GExpression.expression to (#GExpression.expression as 'a) for explicit polymorphism *)
      (* For same-cluster classes, structural types are already in correct format *)
      (* We keep the # syntax but add 'as 'a' to make the type variable explicit *)
      List.fold_left param_hier_info ~init:type_str ~f:(fun acc (p, hier_opt) ->
        match hier_opt with
        | Some hier when hier.hierarchy <> MonomorphicType ->
            (* Skip if same cluster - structural type already correct *)
            if is_same_cluster_class ~same_cluster_classes p.param_type.name then
              acc
            else
              (* let class_type = hierarchy_class_type ~current_layer2_module hier in *)
              let class_name = (ocaml_type_of_gir_type ~ctx ~current_layer2_module p.param_type) in
              let class_type = "#"^ (Option.get class_name) in
              let class_type_pattern = class_type in
              let pattern_option = class_type_pattern ^ " option" in
              let partial_option = sprintf "(%s as 'a) option" class_type in
              (* Replace with 'as 'a' for option types, keep as-is for non-option *)
              acc
              |> Str.global_replace (Str.regexp_string pattern_option) partial_option
        | _ -> acc)
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
              Some (sprintf "'a. %s" signature)
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
        List.iter param_info ~f:(fun (name, p, hier_opt) ->
          match hier_opt with
          | Some hier when hier.hierarchy <> MonomorphicType ->
              if p.nullable || p.param_type.nullable then
                
                
                bprintf buf "      let %s = Option.map (fun (c) -> c#%s) %s in\n"
                  name hier.accessor_method name
              else ()
          | _ -> ()
        );
        bprintf buf "      %s(%s.%s obj" ret_wrapper module_name ocaml_name
      end else begin
        bprintf buf "    %s(%s.%s obj" ret_wrapper module_name ocaml_name
      end;

      List.iter param_info ~f:(fun (name, p, hier_opt) ->
        match hier_opt with
        | Some hier ->
            if p.nullable || p.param_type.nullable then
              if has_hierarchy_with_annotation then
                bprintf buf " %s" name
              else
                bprintf buf " (Option.map (fun c -> (c#%s )) %s)" hier.accessor_method name
            else
              bprintf buf " (%s#%s )" name hier.accessor_method
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
            ocaml_name type_ann param_list ret_wrapper module_name ocaml_name layer1_params
      | None ->
          bprintf buf "  method %s %s = %s(%s.%s obj %s)\n"
            ocaml_name param_list ret_wrapper module_name ocaml_name layer1_params
    end;

    (Buffer.contents buf, seen)

let generate_method_signatures ~ctx ~property_method_names ~property_base_names ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes (meth : gir_method) =
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

  (* Inheritance *)
  Option.iter (fun hierarchy_info ->
    if not (String.equal hierarchy_info.gir_root class_name) then
      bprintf buf "  inherit %s.%s (%s.%s obj)\n" hierarchy_info.layer2_module hierarchy_info.class_type_name layer1_module_name hierarchy_info.accessor_method
  ) hierarchy_info;

  bprintf buf "\n";

  (* Signal handler (currently commented out) *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    let _ = signal_module in ()
    (* bprintf buf "  method connect = new %s.%s obj\n\n"
      signal_module (signal_class_name class_name) *)
  end;

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
      let chunk, seen = generate_method_wrappers ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~module_name:layer1_module_name ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes m in
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

  (* Inheritance *)
  Option.iter (fun hierarchy_info ->
    if not (String.equal hierarchy_info.gir_root class_name) then
      bprintf buf "    inherit %s.%s\n" hierarchy_info.layer2_module hierarchy_info.class_type_name
  ) hierarchy_info;

  (* Signal handler (currently commented out) *)
  if has_any_signals then begin
    let signal_module = get_signal_module_name class_snake in
    let _ = signal_module in ()
    (* bprintf buf "    method connect : %s.%s\n" signal_module (signal_class_name class_name) *)
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
      let chunk, seen = generate_method_signatures ~ctx ~property_method_names:property_filters.method_names ~property_base_names:property_filters.base_names ~class_name ~c_type ~seen ~current_layer2_module ~same_cluster_classes meth in
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
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[] ();

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
    ~class_name ~class_snake ~c_type ~methods ~properties ~signals ~hierarchy_info ~same_cluster_classes:[] ();

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
