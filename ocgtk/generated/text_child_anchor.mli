(** Marks a spot in a [GtkTextBuffer] where child widgets can be “anchored”.

    The anchor can have multiple widgets anchored, to allow for multiple views.

    Its methods, signals and properties are on
    {!class-type-text_child_anchor_t}. The functions it is built on are in
    {!Ocgtk.Raw.Text_child_anchor}. *)

(** The methods, signals and properties of a [GtkTextChildAnchor]. *)
class type text_child_anchor_t = object
  method get_deleted : unit -> bool
  method as_text_child_anchor : Raw.Text_child_anchor.t
end

class text_child_anchor : Raw.Text_child_anchor.t -> text_child_anchor_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Text_child_anchor.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTextChildAnchor], give one already wrapped. *)

val new_ : unit -> text_child_anchor_t
val new_with_replacement : string -> text_child_anchor_t
