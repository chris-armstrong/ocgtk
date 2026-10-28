(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Path from cyclic group Path_and__path_measure_and__path_point *)

(** Describes lines and curves that are more complex than simple rectangles.

    Its methods, signals and properties are on {!class-type-path_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Path}. *)

(** {1:class Class} *)

class type path_t = Path_and__path_measure_and__path_point.path_t
(** {b The methods, signals and properties of a [Path].}

    Describes lines and curves that are more complex than simple rectangles.

    Paths can used for rendering (filling or stroking) and for animations (e.g.
    as trajectories).

    [GskPath] is an immutable, opaque, reference-counted struct. After creation,
    you cannot change the types it represents. Instead, new [GskPath] objects
    have to be created. The [Gsk.PathBuilder] structure is meant to help in this
    endeavor.

    Conceptually, a path consists of zero or more contours (continuous,
    connected curves), each of which may or may not be closed. Contours are
    typically constructed from Bézier segments.

    A Path *)

class path : Raw.Path.t -> path_t
(** Wraps a raw handle of {!Ocgsk.Raw.Path.t}. *)

(** {1:description Description}

    Describes lines and curves that are more complex than simple rectangles.

    Paths can used for rendering (filling or stroking) and for animations (e.g.
    as trajectories).

    [GskPath] is an immutable, opaque, reference-counted struct. After creation,
    you cannot change the types it represents. Instead, new [GskPath] objects
    have to be created. The [Gsk.PathBuilder] structure is meant to help in this
    endeavor.

    Conceptually, a path consists of zero or more contours (continuous,
    connected curves), each of which may or may not be closed. Contours are
    typically constructed from Bézier segments.

    A Path *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
