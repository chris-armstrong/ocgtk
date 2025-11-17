(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextView *)

type t = Gtk.Widget.t

(** Create a new TextView *)
external new_ : unit -> t = "ml_gtk_text_view_new"

(* Properties *)

(** Get property: editable *)
external get_editable : t -> bool = "ml_gtk_text_view_get_editable"

(** Set property: editable *)
external set_editable : t -> bool -> unit = "ml_gtk_text_view_set_editable"

(** Get property: cursor-visible *)
external get_cursor_visible : t -> bool = "ml_gtk_text_view_get_cursor_visible"

(** Set property: cursor-visible *)
external set_cursor_visible : t -> bool -> unit = "ml_gtk_text_view_set_cursor_visible"

(** Get property: wrap-mode *)
external get_wrap_mode : t -> int = "ml_gtk_text_view_get_wrap_mode"

(** Set property: wrap-mode *)
external set_wrap_mode : t -> int -> unit = "ml_gtk_text_view_set_wrap_mode"

(** Get property: left-margin *)
external get_left_margin : t -> int = "ml_gtk_text_view_get_left_margin"

(** Set property: left-margin *)
external set_left_margin : t -> int -> unit = "ml_gtk_text_view_set_left_margin"

(** Get property: right-margin *)
external get_right_margin : t -> int = "ml_gtk_text_view_get_right_margin"

(** Set property: right-margin *)
external set_right_margin : t -> int -> unit = "ml_gtk_text_view_set_right_margin"

(** Get property: monospace *)
external get_monospace : t -> bool = "ml_gtk_text_view_get_monospace"

(** Set property: monospace *)
external set_monospace : t -> bool -> unit = "ml_gtk_text_view_set_monospace"

(* Methods *)

(** Get the buffer *)
external get_buffer : t -> Gtk.Widget.t = "ml_gtk_text_view_get_buffer"

(** Set the buffer *)
external set_buffer : t -> Gtk.Widget.t -> unit = "ml_gtk_text_view_set_buffer"
