(* Property generation for class generation *)

[@@@warning "-32-33"]
open StdLabels
open Printf
open Types

(* Use Class_gen_helpers for shared functions
   Note: open StdLabels is needed here despite Class_gen_helpers having it,
   because opens don't propagate through include *)
include Class_gen_helpers

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
          let class_type = "#"^ (Option.get class_name) in
          if p.nullable || p.param_type.nullable then
              (class_type ^ " option")
          else
              class_type
    | _ ->
        (* Regular type *)
        let gir_type = { p.param_type with nullable = p.nullable || p.param_type.nullable } in
        Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:gir_type |> Option.get

(* Generic property code generation - refactoring #6 *)
let generate_property_code ~ctx ~class_name ~methods  ~seen ~generate_getter ~generate_setter (prop : gir_property) =
  if not (Filtering.should_generate_property ~ctx ~class_name ~methods  prop) then ("", seen)
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
    let impl = match Type_resolution.resolve_layer2_class_ref ~ctx ~current_layer2_module ~gir_type:prop.prop_type with
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

    let (method_params_expr, value_resolve_expr, impl_wrapper) =
      match Type_mappings.find_type_mapping_for_gir_type ~ctx prop.prop_type with
      | Some { layer2_class = Some class_info ; _} ->
          let class_ref = (Type_resolution.resolve_layer2_class_ref ~ctx ~current_layer2_module ~gir_type:prop.prop_type |> Option.value ~default:(class_info.class_module ^ "." ^ class_info.class_type)) in
          sprintf ": 'a . (#%s as 'a) -> unit " class_ref,
          "v#as_" ^ (Utils.ocaml_class_name class_info.class_type),
          "fun v -> "
      | _ -> ("v", "v", "")
    in
    let impl = if prop.prop_type.nullable then
      sprintf "match %s with | Some v -> %s.set_%s obj v | None -> %s.set_%s obj None" value_resolve_expr module_name prop_snake module_name prop_snake
    else
      sprintf "%s.set_%s obj %s" module_name prop_snake value_resolve_expr
    in
    sprintf "  method %s %s = %s %s\n" method_name method_params_expr impl_wrapper impl
  in
  let _ = same_cluster_classes in (* Will be used in type annotations if needed *)
  generate_property_code ~ctx ~seen ~generate_getter ~generate_setter prop

let generate_property_signatures ~ctx ~class_name ~methods  ~seen ~current_layer2_module ~same_cluster_classes (prop : gir_property) =
  let generate_getter _prop prop_snake =
      let ocaml_type = match Type_resolution.resolve_ocaml_type ~ctx ~current_layer2_module ~gir_type:prop.prop_type with
        | None -> ""
        | Some ocaml_type ->
      (* Check if this is a same-cluster class reference and convert to structural type *)

          if is_same_cluster_class ~same_cluster_classes prop.prop_type.name then
            let structural = structural_type_for_class ~ctx prop.prop_type.name in
            if prop.prop_type.nullable then structural ^ " option" else structural
          else
            if prop.prop_type.nullable then ocaml_type ^ " option" else ocaml_type
      in
      let method_name = prop_snake |> Utils.sanitize_identifier in
      sprintf "    method %s : %s\n" method_name ocaml_type
    in
  let generate_setter _prop prop_snake =
    let ocaml_type = map_param_sig ~ctx ~current_layer2_module ~same_cluster_classes {param_name = prop.prop_name; param_type = prop.prop_type; direction = Out; varargs = false; nullable = prop.prop_type.nullable} in
    let method_name = "set_"^prop_snake |> Utils.sanitize_identifier in
    sprintf "    method %s : %s -> unit\n" method_name ocaml_type
  in
  generate_property_code ~ctx ~class_name ~methods  ~seen ~generate_getter ~generate_setter prop