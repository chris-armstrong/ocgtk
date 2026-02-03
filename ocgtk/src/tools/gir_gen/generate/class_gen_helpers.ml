(* Helper functions extracted from class_gen.ml (Phase 1) *)

open StdLabels
open Printf
open Types

(* Use Common.StringSet for type compatibility across modules *)
include Common

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

let get_property_filters ~ctx ~class_name ~methods  properties = {
  method_names = Filtering.property_method_names ~ctx ~class_name ~methods properties;
  base_names = Filtering.property_base_names ~ctx ~class_name ~methods  properties;
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

let has_type_variable type_str =
  (* Check if the type contains an type-variable wildcard (like "_ Gdk.event") *)
  let parts = Str.split (Str.regexp "[ \t]+") type_str in
  List.exists ~f:(fun part -> part = "'a") parts

(* Check if a parameter is a hierarchy type and get its info *)
let get_param_hierarchy_info ~ctx (param : gir_param) : hierarchy_info option =
  Hierarchy_detection.get_hierarchy_info ctx param.param_type.name

(* Helper to determine if a method should be skipped during generation *)
let should_skip_method ~ctx (meth : gir_method) =
  let has_interface_param = Filtering.method_has_interface_param ~ctx meth in
  let has_cross_namespace_type = Filtering.method_has_cross_namespace_types ~ctx meth in
  let has_out_param = List.exists meth.parameters ~f:(fun p -> p.direction = Out || p.direction = InOut) in
  let should_skip_binding = Filtering.should_skip_method_binding ~ctx meth in
  should_skip_binding || has_out_param || has_interface_param || has_cross_namespace_type