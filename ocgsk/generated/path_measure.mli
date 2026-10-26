(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for PathMeasure from cyclic group Path_and__path_measure_and__path_point *)

class type path_measure_t =
  Path_and__path_measure_and__path_point.path_measure_t

class path_measure : Raw.Path_measure.t -> path_measure_t

val new_ : Raw.Path.t -> path_measure_t
val new_with_tolerance : Raw.Path.t -> float -> path_measure_t
