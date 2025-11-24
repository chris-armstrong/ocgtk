(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Adjustment *)

type t = Gtk.widget

external new_ : float -> float -> float -> float -> float -> float -> t = "ml_gtk_adjustment_new_bytecode" "ml_gtk_adjustment_new_native"

(* Properties *)

external get_lower : t -> float = "ml_gtk_adjustment_get_lower"

external set_lower : t -> float -> unit = "ml_gtk_adjustment_set_lower"

external get_page_increment : t -> float = "ml_gtk_adjustment_get_page_increment"

external set_page_increment : t -> float -> unit = "ml_gtk_adjustment_set_page_increment"

external get_page_size : t -> float = "ml_gtk_adjustment_get_page_size"

external set_page_size : t -> float -> unit = "ml_gtk_adjustment_set_page_size"

external get_step_increment : t -> float = "ml_gtk_adjustment_get_step_increment"

external set_step_increment : t -> float -> unit = "ml_gtk_adjustment_set_step_increment"

external get_upper : t -> float = "ml_gtk_adjustment_get_upper"

external set_upper : t -> float -> unit = "ml_gtk_adjustment_set_upper"

external get_value : t -> float = "ml_gtk_adjustment_get_value"

external set_value : t -> float -> unit = "ml_gtk_adjustment_set_value"

external get_minimum_increment : t -> float = "ml_gtk_adjustment_get_minimum_increment"

external configure : t -> float -> float -> float -> float -> float -> float -> unit = "ml_gtk_adjustment_configure_bytecode" "ml_gtk_adjustment_configure_native"

external clamp_page : t -> float -> float -> unit = "ml_gtk_adjustment_clamp_page"

