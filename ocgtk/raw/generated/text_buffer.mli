(* GENERATED CODE - DO NOT EDIT *)
(* TextBuffer, a member of the cyclic module Text_buffer_and__text_iter_and__text_mark *)

(** Stores text and attributes for display in a [GtkTextView].

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    GtkTextBuffer can support undoing changes to the buffer content, see
    [Gtk.TextBuffer.set_enable_undo].

    The class built on this module is in {!Ocgtk.Text_buffer}. *)

include module type of struct
  include Text_buffer_and__text_iter_and__text_mark.Text_buffer
end
