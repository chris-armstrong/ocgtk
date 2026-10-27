(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for PathMeasure from cyclic group Path_and__path_measure_and__path_point *)

(** Performs measurements on paths such as determining the length of the path.

    Many measuring operations require sampling the path length at intermediate
    points. Therefore, a [GskPathMeasure] has a tolerance that determines what
    precision is required for such approximations.

    A [GskPathMeasure] struct is a reference counted struct and should be
    treated as opaque.

    Its methods, signals and properties are on {!class-type-path_measure_t}. The
    functions it is built on are in {!Ocgsk.Raw.Path_measure}. *)

class type path_measure_t =
  Path_and__path_measure_and__path_point.path_measure_t
(** The methods, signals and properties of a [GskPathMeasure]. *)

class path_measure : Raw.Path_measure.t -> path_measure_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path_measure.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPathMeasure], give one already wrapped. *)

val new_ : Raw.Path.t -> path_measure_t
val new_with_tolerance : Raw.Path.t -> float -> path_measure_t
