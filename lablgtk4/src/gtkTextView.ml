(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextView - implementation *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_text_view_new"

external get_editable : t -> bool = "ml_gtk_text_view_get_editable"
external set_editable : t -> bool -> unit = "ml_gtk_text_view_set_editable"

external get_cursor_visible : t -> bool = "ml_gtk_text_view_get_cursor_visible"
external set_cursor_visible : t -> bool -> unit = "ml_gtk_text_view_set_cursor_visible"

external get_wrap_mode : t -> int = "ml_gtk_text_view_get_wrap_mode"
external set_wrap_mode : t -> int -> unit = "ml_gtk_text_view_set_wrap_mode"

external get_left_margin : t -> int = "ml_gtk_text_view_get_left_margin"
external set_left_margin : t -> int -> unit = "ml_gtk_text_view_set_left_margin"

external get_right_margin : t -> int = "ml_gtk_text_view_get_right_margin"
external set_right_margin : t -> int -> unit = "ml_gtk_text_view_set_right_margin"

external get_monospace : t -> bool = "ml_gtk_text_view_get_monospace"
external set_monospace : t -> bool -> unit = "ml_gtk_text_view_set_monospace"

external get_buffer : t -> Gtk.Widget.t = "ml_gtk_text_view_get_buffer"
external set_buffer : t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_set_buffer"
