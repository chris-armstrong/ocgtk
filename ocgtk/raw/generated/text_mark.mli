(* GENERATED CODE - DO NOT EDIT *)
(* TextMark, a member of the cyclic module Text_buffer_and__text_iter_and__text_mark *)

(** Marks a position in a [GtkTextbuffer] that is preserved across
    modifications.

    You may wish to begin by reading the text widget conceptual overview, which
    gives an overview of all the objects and data types related to the text
    widget and how they work together.

    A [GtkTextMark] is like a bookmark in a text buffer; it preserves a position
    in the text. You can convert the mark to an iterator using
    [Gtk.TextBuffer.get_iter_at_mark]. Unlike iterators, marks remain valid
    across buffer mutations, because their behavior is defined when text is
    inserted or deleted. When text containing a mark is deleted, the mark
    remains in the position originally occupied by the deleted text. When text
    is inserted at a mark, a mark with “left gravity” will be moved to the
    beginning of the newly-inserted text, and a mark with “right gravity” will
    be moved to the end.

    Note that “left” and “right” here refer to logical direction (left is the
    toward the start of the buffer); in some languages such as Hebrew the
    logically-leftmost text is not actually on the left when displayed.

    Marks are reference counted, but the reference count only controls the
    validity of the memory; marks can be deleted from the buffer at any time
    with [Gtk.TextBuffer.delete_mark]. Once deleted from the buffer, a mark is
    essentially useless.

    Marks optionally have names; these can be convenient to avoid passing the
    [GtkTextMark] object around.

    Marks are typically created using the [Gtk.TextBuffer.create_mark] function.

    The class built on this module is in {!Ocgtk.Text_mark}. *)

include module type of struct
  include Text_buffer_and__text_iter_and__text_mark.Text_mark
end
