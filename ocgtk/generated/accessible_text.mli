(** An interface for accessible objects containing formatted text.

    The [GtkAccessibleText] interfaces is meant to be implemented by accessible
    objects that have text formatted with attributes, or non-trivial text
    contents.

    You should use the [Gtk.AccessibleProperty.LABEL] or the
    [Gtk.AccessibleProperty.DESCRIPTION] properties for accessible objects
    containing simple, unformatted text.

    Its methods, signals and properties are on {!class-type-accessible_text_t}.
    The functions it is built on are in {!Ocgtk.Raw.Accessible_text}. *)

(** The methods, signals and properties of a [GtkAccessibleText]. *)
class type accessible_text_t = object
  method update_caret_position : unit -> unit

  method update_contents :
    Enums.accessibletextcontentchange -> int -> int -> unit

  method update_selection_bound : unit -> unit
  method as_accessible_text : Raw.Accessible_text.t
end

class accessible_text : Raw.Accessible_text.t -> accessible_text_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Accessible_text.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkAccessibleText], give one already wrapped. *)
