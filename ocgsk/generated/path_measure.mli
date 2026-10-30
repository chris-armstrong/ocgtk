(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for PathMeasure from cyclic group Path_and__path_measure_and__path_point *)

(** Performs measurements on paths such as determining the length of the path.

    Its methods, signals and properties are on {!class-type-path_measure_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Path_measure}. *)

(** {1:class Class} *)

class type path_measure_t =
  Path_and__path_measure_and__path_point.path_measure_t
(** {b The methods, signals and properties of a [PathMeasure].}

    Performs measurements on paths such as determining the length of the path.

    Many measuring operations require sampling the path length at intermediate
    points. Therefore, a [GskPathMeasure] has a tolerance that determines what
    precision is required for such approximations.

    A [GskPathMeasure] struct is a reference counted struct and should be
    treated as opaque. *)

class path_measure : Raw.Path_measure.t -> path_measure_t
(** Wraps a raw handle of {!Ocgsk.Raw.Path_measure.t}. *)

(** {1:description Description}

    Performs measurements on paths such as determining the length of the path.

    Many measuring operations require sampling the path length at intermediate
    points. Therefore, a [GskPathMeasure] has a tolerance that determines what
    precision is required for such approximations.

    A [GskPathMeasure] struct is a reference counted struct and should be
    treated as opaque. *)

(** {1:constructors Constructors} *)

val new_ : Raw.Path.t -> path_measure_t
(** Creates a measure object for the given [path] with the default tolerance. *)

val new_with_tolerance : Raw.Path.t -> float -> path_measure_t
(** Creates a measure object for the given [path] and [tolerance]. *)
