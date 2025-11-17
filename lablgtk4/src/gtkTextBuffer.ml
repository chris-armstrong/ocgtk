(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextBuffer - implementation *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_text_buffer_new"

external get_text : t -> string = "ml_gtk_text_buffer_get_text"
external set_text : t -> string -> unit = "ml_gtk_text_buffer_set_text"

external get_modified : t -> bool = "ml_gtk_text_buffer_get_modified"
external set_modified : t -> bool -> unit = "ml_gtk_text_buffer_set_modified"

external get_line_count : t -> int = "ml_gtk_text_buffer_get_line_count"
external get_char_count : t -> int = "ml_gtk_text_buffer_get_char_count"
