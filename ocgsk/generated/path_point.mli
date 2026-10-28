(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for PathPoint from cyclic group Path_and__path_measure_and__path_point *)

(** Represents a point on a path.

    It can be queried for properties of the path at that point, such as its
    tangent or its curvature.

    To obtain a [GskPathPoint], use [Gsk.Path.get_closest_point],
    [Gsk.Path.get_start_point], [Gsk.Path.get_end_point] or
    [Gsk.PathMeasure.get_point].

    Note that [GskPathPoint] structs are meant to be stack-allocated, and don't
    hold a reference to the path object they are obtained from. It is the
    callers responsibility to keep a reference to the path as long as the
    [GskPathPoint] is used.

    Its methods, signals and properties are on {!class-type-path_point_t}. The
    functions it is built on are in {!Ocgsk.Raw.Path_point}. *)

class type path_point_t = Path_and__path_measure_and__path_point.path_point_t
(** {b The methods, signals and properties of a [PathPoint].}

    Represents a point on a path.

    It can be queried for properties of the path at that point, such as its
    tangent or its curvature.

    To obtain a [GskPathPoint], use [Gsk.Path.get_closest_point],
    [Gsk.Path.get_start_point], [Gsk.Path.get_end_point] or
    [Gsk.PathMeasure.get_point].

    Note that [GskPathPoint] structs are meant to be stack-allocated, and don't
    hold a reference to the path object they are obtained from. It is the
    callers responsibility to keep a reference to the path as long as the
    [GskPathPoint] is used. *)

class path_point : Raw.Path_point.t -> path_point_t
(** Wraps a raw handle of {!Ocgsk.Raw.Path_point.t}. *)
