(** Specifies a border around a rectangular area.

    Each side can have a different width.

    Its methods, signals and properties are on {!class-type-border_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Border}. *)

(** {b The methods, signals and properties of a [Border].}

    Specifies a border around a rectangular area.

    Each side can have a different width. *)
class type border_t = object
  method as_border : Raw.Border.t
end

class border : Raw.Border.t -> border_t
(** Wraps a raw handle of {!Ocgtk.Raw.Border.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> border_t
(** Allocates a new [GtkBorder] struct and initializes its elements to zero. *)
