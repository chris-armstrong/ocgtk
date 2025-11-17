(* Phase 5.3: GtkTextIter OCaml Implementation
 *
 * TextIter is a stack-allocated structure (not a GObject) that represents
 * a position in a TextBuffer.
 *
 * All functionality is provided by C externals defined in ml_gtk_text.c
 *)

type t

(* Copying and Assignment *)
external copy : t -> t = "ml_gtk_text_iter_copy"
external assign : t -> t -> unit = "ml_gtk_text_iter_assign"

(* Position Information *)
external get_offset : t -> int = "ml_gtk_text_iter_get_offset"
external get_line : t -> int = "ml_gtk_text_iter_get_line"
external get_line_offset : t -> int = "ml_gtk_text_iter_get_line_offset"
external get_line_index : t -> int = "ml_gtk_text_iter_get_line_index"

(* Movement *)
external forward_char : t -> bool = "ml_gtk_text_iter_forward_char"
external backward_char : t -> bool = "ml_gtk_text_iter_backward_char"
external forward_chars : t -> int -> bool = "ml_gtk_text_iter_forward_chars"
external backward_chars : t -> int -> bool = "ml_gtk_text_iter_backward_chars"
external forward_line : t -> bool = "ml_gtk_text_iter_forward_line"
external backward_line : t -> bool = "ml_gtk_text_iter_backward_line"
external forward_lines : t -> int -> bool = "ml_gtk_text_iter_forward_lines"
external backward_lines : t -> int -> bool = "ml_gtk_text_iter_backward_lines"
external forward_to_line_end : t -> bool = "ml_gtk_text_iter_forward_to_line_end"

(* Setting Position *)
external set_offset : t -> int -> unit = "ml_gtk_text_iter_set_offset"
external set_line : t -> int -> unit = "ml_gtk_text_iter_set_line"
external set_line_offset : t -> int -> unit = "ml_gtk_text_iter_set_line_offset"
external set_line_index : t -> int -> unit = "ml_gtk_text_iter_set_line_index"

(* Comparison *)
external equal : t -> t -> bool = "ml_gtk_text_iter_equal"
external compare : t -> t -> int = "ml_gtk_text_iter_compare"

(* Text Access *)
external get_char : t -> int = "ml_gtk_text_iter_get_char"
external get_slice : t -> t -> string = "ml_gtk_text_iter_get_slice"
external get_text : t -> t -> string = "ml_gtk_text_iter_get_text"

(* Buffer Access *)
external get_buffer : t -> GtkTextBuffer.t = "ml_gtk_text_iter_get_buffer"
