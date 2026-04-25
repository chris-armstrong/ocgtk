(* Common shared types for class generation modules *)

open StdLabels

module StringSet = Set.Make (String)
(** Shared StringSet type - all class_gen modules use this type to avoid type
    incompatibility *)

type module_names = { layer1 : string; layer2 : string }
(** Shared module names type *)

type property_filters = { method_names : string list; base_names : string list }
(** Shared property filters type *)
