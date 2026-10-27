(** Specifies a border around a rectangular area.

    Each side can have a different width.

    Its methods, signals and properties are on {!class-type-border_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Border}. *)

(** The methods, signals and properties of a [GtkBorder]. *)
class type border_t = object
  method as_border : Raw.Border.t
end

class border : Raw.Border.t -> border_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Border.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBorder], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : unit -> border_t
(** Allocates a new [GtkBorder] struct and initializes its elements to zero. *)
