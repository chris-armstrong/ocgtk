(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ScaleButton *)

type t = Gtk.widget

external new_ : float -> float -> float -> unit -> t = "ml_gtk_scale_button_new"

(* Properties *)

external get_active : t -> bool = "ml_gtk_scale_button_get_active"

external get_has_frame : t -> bool = "ml_gtk_scale_button_get_has_frame"

external set_has_frame : t -> bool -> unit = "ml_gtk_scale_button_set_has_frame"

external get_value : t -> float = "ml_gtk_scale_button_get_value"

external set_value : t -> float -> unit = "ml_gtk_scale_button_set_value"

external set_adjustment : t -> Gtk.widget -> unit = "ml_gtk_scale_button_set_adjustment"

external get_popup : t -> Gtk.widget = "ml_gtk_scale_button_get_popup"

external get_plus_button : t -> Gtk.widget = "ml_gtk_scale_button_get_plus_button"

external get_minus_button : t -> Gtk.widget = "ml_gtk_scale_button_get_minus_button"

external get_adjustment : t -> Gtk.widget = "ml_gtk_scale_button_get_adjustment"

