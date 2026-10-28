(* GENERATED CODE - DO NOT EDIT *)
(* Path, a member of the cyclic module Path_and__path_measure_and__path_point *)

(** Describes lines and curves that are more complex than simple rectangles.

    Paths can used for rendering (filling or stroking) and for animations (e.g.
    as trajectories).

    [GskPath] is an immutable, opaque, reference-counted struct. After creation,
    you cannot change the types it represents. Instead, new [GskPath] objects
    have to be created. The [Gsk.PathBuilder] structure is meant to help in this
    endeavor.

    Conceptually, a path consists of zero or more contours (continuous,
    connected curves), each of which may or may not be closed. Contours are
    typically constructed from Bézier segments.

    A Path

    The class built on this module is in {!Ocgsk.Path}. *)

include module type of struct
  include Path_and__path_measure_and__path_point.Path
end
