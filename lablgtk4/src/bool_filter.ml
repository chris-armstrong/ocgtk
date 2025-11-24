(* GENERATED CODE - DO NOT EDIT *)
(* Widget: BoolFilter *)

type t = Gtk.Widget.t

external new_ : Gtk.Widget.t option -> t = "ml_gtk_bool_filter_new"

(* Properties *)

external get_invert : t -> bool = "ml_gtk_bool_filter_get_invert"

external set_invert : t -> bool -> unit = "ml_gtk_bool_filter_set_invert"

external set_expression : t -> Gtk.Widget.t option -> unit = "ml_gtk_bool_filter_set_expression"

external get_expression : t -> Gtk.Widget.t = "ml_gtk_bool_filter_get_expression"

