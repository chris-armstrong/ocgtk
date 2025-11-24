(* GENERATED CODE - DO NOT EDIT *)
(* Widget: BoolFilter *)

type t = Gtk.widget

(** Create a new BoolFilter *)
external new_ : Gtk.widget option -> t = "ml_gtk_bool_filter_new"

(* Properties *)

(** Get property: invert *)
external get_invert : t -> bool = "ml_gtk_bool_filter_get_invert"

(** Set property: invert *)
external set_invert : t -> bool -> unit = "ml_gtk_bool_filter_set_invert"

external set_expression : t -> Gtk.widget option -> unit = "ml_gtk_bool_filter_set_expression"

external get_expression : t -> Gtk.widget = "ml_gtk_bool_filter_get_expression"

