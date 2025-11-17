(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextBuffer *)

type t = Gtk.Widget.t

(** Create a new TextBuffer *)
external new_ : unit -> t = "ml_gtk_text_buffer_new"

(* Properties *)

(** Get property: text *)
external get_text : t -> string = "ml_gtk_text_buffer_get_text"

(** Set property: text *)
external set_text : t -> string -> unit = "ml_gtk_text_buffer_set_text"

(** Get property: modified *)
external get_modified : t -> bool = "ml_gtk_text_buffer_get_modified"

(** Set property: modified *)
external set_modified : t -> bool -> unit = "ml_gtk_text_buffer_set_modified"

(* Methods *)

(** Get the number of lines *)
external get_line_count : t -> int = "ml_gtk_text_buffer_get_line_count"

(** Get the number of characters *)
external get_char_count : t -> int = "ml_gtk_text_buffer_get_char_count"
