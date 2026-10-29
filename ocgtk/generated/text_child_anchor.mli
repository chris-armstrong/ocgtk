(** Marks a spot in a [GtkTextBuffer] where child widgets can be “anchored”.

    Its methods, signals and properties are on
    {!class-type-text_child_anchor_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Text_child_anchor}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TextChildAnchor].}

    Marks a spot in a [GtkTextBuffer] where child widgets can be “anchored”.

    The anchor can have multiple widgets anchored, to allow for multiple views.
*)
class type text_child_anchor_t = object
  (** {2:methods Methods} *)

  method get_deleted : unit -> bool
  (** Determines whether a child anchor has been deleted from the buffer.

      Keep in mind that the child anchor will be unreferenced when removed from
      the buffer, so you need to hold your own reference (with g_object_ref())
      if you plan to use this function — otherwise all deleted child anchors
      will also be finalized. *)

  (** {2:conversions Conversions} *)

  method as_text_child_anchor : Raw.Text_child_anchor.t
end

class text_child_anchor : Raw.Text_child_anchor.t -> text_child_anchor_t
(** Wraps a raw handle of {!Ocgtk.Raw.Text_child_anchor.t}. *)

(** {1:description Description}

    Marks a spot in a [GtkTextBuffer] where child widgets can be “anchored”.

    The anchor can have multiple widgets anchored, to allow for multiple views.
*)

(** {1:constructors Constructors} *)

val new_ : unit -> text_child_anchor_t
(** Creates a new [GtkTextChildAnchor].

    Usually you would then insert it into a [GtkTextBuffer] with
    {{!Ocgtk.Text_buffer.class-type-text_buffer_t.method-insert_child_anchor}[Gtk.TextBuffer.insert_child_anchor]}.
    To perform the creation and insertion in one step, use the convenience
    function
    {{!Ocgtk.Text_buffer.class-type-text_buffer_t.method-create_child_anchor}[Gtk.TextBuffer.create_child_anchor]}.
*)

val new_with_replacement : string -> text_child_anchor_t
(** Creates a new [GtkTextChildAnchor] with the given replacement character.

    Usually you would then insert it into a [GtkTextBuffer] with
    {{!Ocgtk.Text_buffer.class-type-text_buffer_t.method-insert_child_anchor}[Gtk.TextBuffer.insert_child_anchor]}.
*)
