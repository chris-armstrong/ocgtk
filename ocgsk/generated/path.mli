(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Path from cyclic group Path_and__path_measure_and__path_point *)

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

    Its methods, signals and properties are on {!class-type-path_t}. The
    functions it is built on are in {!Ocgsk.Raw.Path}. *)

class type path_t = Path_and__path_measure_and__path_point.path_t
(** The methods, signals and properties of a [GskPath]. *)

class path : Raw.Path.t -> path_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Path.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GskPath], give one already wrapped. *)
