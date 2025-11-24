(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SpinButton *)

type t = Gtk.widget

external new_ : Gtk.widget option -> float -> int -> t = "ml_gtk_spin_button_new"

external new_with_range : float -> float -> float -> t = "ml_gtk_spin_button_new_with_range"

(* Properties *)

external get_activates_default : t -> bool = "ml_gtk_spin_button_get_activates_default"

external set_activates_default : t -> bool -> unit = "ml_gtk_spin_button_set_activates_default"

external get_climb_rate : t -> float = "ml_gtk_spin_button_get_climb_rate"

external set_climb_rate : t -> float -> unit = "ml_gtk_spin_button_set_climb_rate"

external get_digits : t -> int = "ml_gtk_spin_button_get_digits"

external set_digits : t -> int -> unit = "ml_gtk_spin_button_set_digits"

external get_numeric : t -> bool = "ml_gtk_spin_button_get_numeric"

external set_numeric : t -> bool -> unit = "ml_gtk_spin_button_set_numeric"

external get_snap_to_ticks : t -> bool = "ml_gtk_spin_button_get_snap_to_ticks"

external set_snap_to_ticks : t -> bool -> unit = "ml_gtk_spin_button_set_snap_to_ticks"

external get_value : t -> float = "ml_gtk_spin_button_get_value"

external set_value : t -> float -> unit = "ml_gtk_spin_button_set_value"

external get_wrap : t -> bool = "ml_gtk_spin_button_get_wrap"

external set_wrap : t -> bool -> unit = "ml_gtk_spin_button_set_wrap"

external update : t -> unit = "ml_gtk_spin_button_update"

external spin : t -> Gtk_enums.spintype -> float -> unit = "ml_gtk_spin_button_spin"

external set_update_policy : t -> Gtk_enums.spinbuttonupdatepolicy -> unit = "ml_gtk_spin_button_set_update_policy"

external set_range : t -> float -> float -> unit = "ml_gtk_spin_button_set_range"

external set_increments : t -> float -> float -> unit = "ml_gtk_spin_button_set_increments"

external set_adjustment : t -> Gtk.widget -> unit = "ml_gtk_spin_button_set_adjustment"

external get_value_as_int : t -> int = "ml_gtk_spin_button_get_value_as_int"

external get_update_policy : t -> Gtk_enums.spinbuttonupdatepolicy = "ml_gtk_spin_button_get_update_policy"

external get_adjustment : t -> Gtk.widget = "ml_gtk_spin_button_get_adjustment"

external configure : t -> Gtk.widget option -> float -> int -> unit = "ml_gtk_spin_button_configure"

