(* GENERATED CODE - DO NOT EDIT *)
(* PathMeasure, a member of the cyclic module Path_and__path_measure_and__path_point *)

(** Performs measurements on paths such as determining the length of the path.

    Many measuring operations require sampling the path length at intermediate
    points. Therefore, a [GskPathMeasure] has a tolerance that determines what
    precision is required for such approximations.

    A [GskPathMeasure] struct is a reference counted struct and should be
    treated as opaque.

    The class built on this module is in {!Ocgsk.Path_measure}. *)

include module type of struct
  include Path_and__path_measure_and__path_point.Path_measure
end
