(* Class-specific type resolution functions
   This module contains class_gen-specific logic for polymorphic types and structural types
   Separate from the shared type_resolution.ml module
 *)

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

(* Convert # syntax to partial object types for .ml files
   Converts #Module.class_type to (#Module.class_type as 'pN) for explicit polymorphism
   For same-cluster classes, structural types are already in correct format
   param_info: list of (name, param, hierarchy_info_option) tuples from method parameters *)
let convert_to_partial_object_type ~ctx ~current_layer2_module ~same_cluster_classes ~param_info type_str =
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