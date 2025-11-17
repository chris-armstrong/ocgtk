(* Phase 5.3: GtkTextIter OCaml Interface
 *
 * TextIter is a stack-allocated structure (not a GObject) that represents
 * a position in a TextBuffer. It's used for inserting, deleting, and
 * navigating text.
 *)

(** Type representing a position in a text buffer *)
type t

(** {2 Copying and Assignment} *)

(** Create a copy of an iterator *)
external copy : t -> t = "ml_gtk_text_iter_copy"

(** Assign one iterator to another *)
external assign : t -> t -> unit = "ml_gtk_text_iter_assign"

(** {2 Position Information} *)

(** Get the character offset of an iterator (0-based) *)
external get_offset : t -> int = "ml_gtk_text_iter_get_offset"

(** Get the line number (0-based) *)
external get_line : t -> int = "ml_gtk_text_iter_get_line"

(** Get the character offset within the line *)
external get_line_offset : t -> int = "ml_gtk_text_iter_get_line_offset"

(** Get the byte index within the line *)
external get_line_index : t -> int = "ml_gtk_text_iter_get_line_index"

(** {2 Movement} *)

(** Move forward by one character. Returns false if already at end of buffer. *)
external forward_char : t -> bool = "ml_gtk_text_iter_forward_char"

(** Move backward by one character. Returns false if already at start of buffer. *)
external backward_char : t -> bool = "ml_gtk_text_iter_backward_char"

(** Move forward by [count] characters *)
external forward_chars : t -> int -> bool = "ml_gtk_text_iter_forward_chars"

(** Move backward by [count] characters *)
external backward_chars : t -> int -> bool = "ml_gtk_text_iter_backward_chars"

(** Move to the start of the next line. Returns false if on last line. *)
external forward_line : t -> bool = "ml_gtk_text_iter_forward_line"

(** Move to the start of the previous line. Returns false if on first line. *)
external backward_line : t -> bool = "ml_gtk_text_iter_backward_line"

(** Move forward by [count] lines *)
external forward_lines : t -> int -> bool = "ml_gtk_text_iter_forward_lines"

(** Move backward by [count] lines *)
external backward_lines : t -> int -> bool = "ml_gtk_text_iter_backward_lines"

(** Move to the end of the current line *)
external forward_to_line_end : t -> bool = "ml_gtk_text_iter_forward_to_line_end"

(** {2 Setting Position} *)

(** Set position to the given character offset *)
external set_offset : t -> int -> unit = "ml_gtk_text_iter_set_offset"

(** Set position to the start of the given line number *)
external set_line : t -> int -> unit = "ml_gtk_text_iter_set_line"

(** Set position to the given offset within the current line *)
external set_line_offset : t -> int -> unit = "ml_gtk_text_iter_set_line_offset"

(** Set position to the given byte index within the current line *)
external set_line_index : t -> int -> unit = "ml_gtk_text_iter_set_line_index"

(** {2 Comparison} *)

(** Test if two iterators point to the same position *)
external equal : t -> t -> bool = "ml_gtk_text_iter_equal"

(** Compare two iterators. Returns negative if lhs < rhs, 0 if equal, positive if lhs > rhs. *)
external compare : t -> t -> int = "ml_gtk_text_iter_compare"

(** {2 Text Access} *)

(** Get the Unicode character at this position *)
external get_char : t -> int = "ml_gtk_text_iter_get_char"

(** Get text between two iterators, including invisible text *)
external get_slice : t -> t -> string = "ml_gtk_text_iter_get_slice"

(** Get visible text between two iterators *)
external get_text : t -> t -> string = "ml_gtk_text_iter_get_text"

(** {2 Buffer Access} *)

(** Get the buffer this iterator belongs to *)
external get_buffer : t -> GtkTextBuffer.t = "ml_gtk_text_iter_get_buffer"
