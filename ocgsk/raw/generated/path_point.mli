(* GENERATED CODE - DO NOT EDIT *)
(* PathPoint, a member of the cyclic module Path_and__path_measure_and__path_point *)

(** Represents a point on a path.

    It can be queried for properties of the path at that point, such as its
    tangent or its curvature.

    To obtain a [GskPathPoint], use
    {{!Ocgsk.Raw.Path.val-get_closest_point}[Gsk.Path.get_closest_point]},
    {{!Ocgsk.Raw.Path.val-get_start_point}[Gsk.Path.get_start_point]},
    {{!Ocgsk.Raw.Path.val-get_end_point}[Gsk.Path.get_end_point]} or
    {{!Ocgsk.Raw.Path_measure.val-get_point}[Gsk.PathMeasure.get_point]}.

    Note that [GskPathPoint] structs are meant to be stack-allocated, and don't
    hold a reference to the path object they are obtained from. It is the
    callers responsibility to keep a reference to the path as long as the
    [GskPathPoint] is used.

    The class built on this module is in {!Ocgsk.Path_point}. *)

include module type of struct
  include Path_and__path_measure_and__path_point.Path_point
end
