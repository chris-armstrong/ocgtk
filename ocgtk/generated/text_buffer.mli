(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for TextBuffer from cyclic group Text_buffer_and__text_iter_and__text_mark *)

(** Stores text and attributes for display in a [GtkTextView].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    GtkTextBuffer can support undoing changes to the buffer content, see
    [Gtk.TextBuffer.set_enable_undo].

    Its methods, signals and properties are on {!class-type-text_buffer_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Text_buffer}. *)

class type text_buffer_t =
  Text_buffer_and__text_iter_and__text_mark.text_buffer_t
(** {b The methods, signals and properties of a [TextBuffer].}

    Stores text and attributes for display in a [GtkTextView].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    GtkTextBuffer can support undoing changes to the buffer content, see
    [Gtk.TextBuffer.set_enable_undo]. *)

class text_buffer : Raw.Text_buffer.t -> text_buffer_t
(** Wraps a raw handle of {!Ocgtk.Raw.Text_buffer.t}. *)

(** {2:constructors Constructors} *)

val new_ : Text_tag_table.text_tag_table_t option -> text_buffer_t
(** Creates a new text buffer. *)
