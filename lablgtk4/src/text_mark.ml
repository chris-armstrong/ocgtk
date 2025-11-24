(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TextMark *)

type t = Gtk.Widget.t

external new_ : string option -> bool -> t = "ml_gtk_text_mark_new"

(* Properties *)

external get_left_gravity : t -> bool = "ml_gtk_text_mark_get_left_gravity"

external get_name : t -> string = "ml_gtk_text_mark_get_name"

external set_visible : t -> bool -> unit = "ml_gtk_text_mark_set_visible"

external get_visible : t -> bool = "ml_gtk_text_mark_get_visible"

external get_deleted : t -> bool = "ml_gtk_text_mark_get_deleted"

external get_buffer : t -> Gtk.Widget.t = "ml_gtk_text_mark_get_buffer"

