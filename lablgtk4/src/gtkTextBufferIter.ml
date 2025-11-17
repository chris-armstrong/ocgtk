(* Phase 5.3: TextBuffer Iterator Creation Functions
 *
 * All functionality is provided by C externals defined in ml_gtk_text.c
 *)

(* Iterator Creation *)
external get_start_iter : GtkTextBuffer.t -> GtkTextIter.t = "ml_gtk_text_buffer_get_start_iter"
external get_end_iter : GtkTextBuffer.t -> GtkTextIter.t = "ml_gtk_text_buffer_get_end_iter"
external get_iter_at_offset : GtkTextBuffer.t -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_offset"
external get_iter_at_line : GtkTextBuffer.t -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_line"
external get_iter_at_line_offset : GtkTextBuffer.t -> int -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_line_offset"
external get_iter_at_line_index : GtkTextBuffer.t -> int -> int -> GtkTextIter.t = "ml_gtk_text_buffer_get_iter_at_line_index"

(* Text Operations with Iterators *)
external insert : GtkTextBuffer.t -> GtkTextIter.t -> string -> unit = "ml_gtk_text_buffer_insert"
external delete : GtkTextBuffer.t -> GtkTextIter.t -> GtkTextIter.t -> unit = "ml_gtk_text_buffer_delete"
external get_text_range : GtkTextBuffer.t -> GtkTextIter.t -> GtkTextIter.t -> bool -> string = "ml_gtk_text_buffer_get_text_range"
external apply_tag : GtkTextBuffer.t -> GtkTextTag.t -> GtkTextIter.t -> GtkTextIter.t -> unit = "ml_gtk_text_buffer_apply_tag"
external remove_tag : GtkTextBuffer.t -> GtkTextTag.t -> GtkTextIter.t -> GtkTextIter.t -> unit = "ml_gtk_text_buffer_remove_tag"
