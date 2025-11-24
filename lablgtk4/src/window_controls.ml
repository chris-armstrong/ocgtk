(* GENERATED CODE - DO NOT EDIT *)
(* Widget: WindowControls *)

type t = Gtk.Widget.t

external new_ : Gtk_enums.packtype -> t = "ml_gtk_window_controls_new"

(* Properties *)

external get_decoration_layout : t -> string = "ml_gtk_window_controls_get_decoration_layout"

external set_decoration_layout : t -> string -> unit = "ml_gtk_window_controls_set_decoration_layout"

external get_empty : t -> bool = "ml_gtk_window_controls_get_empty"

external set_side : t -> Gtk_enums.packtype -> unit = "ml_gtk_window_controls_set_side"

external get_side : t -> Gtk_enums.packtype = "ml_gtk_window_controls_get_side"

