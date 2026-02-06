(* Common shared types for class generation modules *)

open StdLabels

(** Shared StringSet type - all class_gen modules use this type to avoid type incompatibility *)
module StringSet = Set.Make(String)

(** Shared module names type *)
type module_names = {
  layer1: string;
  layer2: string;
}

(** Shared property filters type *)
type property_filters = {
  method_names: string list;
  base_names: string list;
}