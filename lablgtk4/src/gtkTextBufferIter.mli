(* Phase 5.3: TextBuffer Iterator Creation Functions
 *
 * These functions extend GtkTextBuffer with iterator creation methods.
 * They are separate from the generated bindings because they require
 * special handling of stack-allocated GtkTextIter structures.
 *)

(** {2 Iterator Creation} *)

(** Get an iterator at the start of the buffer *)
external get_start_iter : GtkTextBuffer.t -> GtkTextIter.t = "ml_gtk_text_buffer_get_start_iter"

(** Get an iterator at the end of the buffer *)
external get_end_iter : GtkTextBuffer.t -> GtkTextIter.t = "ml_gtk_text_buffer_get_end_iter"

(** Get an iterator at the given character offset *)
external get_iter_at_offset : GtkTextBuffer.t -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_offset"

(** Get an iterator at the start of the given line *)
external get_iter_at_line : GtkTextBuffer.t -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_line"

(** Get an iterator at the given line and character offset *)
external get_iter_at_line_offset : GtkTextBuffer.t -> int -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_line_offset"

(** Get an iterator at the given line and byte index *)
external get_iter_at_line_index : GtkTextBuffer.t -> int -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_line_index"

(** {2 Text Operations with Iterators} *)

(** Insert text at the given iterator position *)
external insert : GtkTextBuffer.t -> GtkTextIter.t -> string -> unit = "ml_gtk_text_buffer_insert"

(** Delete text between two iterators *)
external delete : GtkTextBuffer.t -> GtkTextIter.t -> GtkTextIter.t -> unit = "ml_gtk_text_buffer_delete"

(** Get text between two iterators *)
external get_text_range : GtkTextBuffer.t -> GtkTextIter.t -> GtkTextIter.t -> bool -> string = "ml_gtk_text_buffer_get_text_range"

(** Apply a tag to a range of text *)
external apply_tag : GtkTextBuffer.t -> GtkTextTag.t -> GtkTextIter.t -> GtkTextIter.t -> unit = "ml_gtk_text_buffer_apply_tag"

(** Remove a tag from a range of text *)
external remove_tag : GtkTextBuffer.t -> GtkTextTag.t -> GtkTextIter.t -> GtkTextIter.t -> unit = "ml_gtk_text_buffer_remove_tag"
