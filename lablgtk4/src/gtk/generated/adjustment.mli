(* GENERATED CODE - DO NOT EDIT *)
(* Adjustment: Adjustment *)

type t = [`adjustment | `initially_unowned] Gobject.obj

(** Create a new Adjustment *)
external new_ : float -> float -> float -> float -> float -> float -> t = "ml_gtk_adjustment_new_bytecode" "ml_gtk_adjustment_new_native"

(* Properties *)

(** Get property: lower *)
external get_lower : t -> float = "ml_gtk_adjustment_get_lower"

(** Set property: lower *)
external set_lower : t -> float -> unit = "ml_gtk_adjustment_set_lower"

(** Get property: page-increment *)
external get_page_increment : t -> float = "ml_gtk_adjustment_get_page_increment"

(** Set property: page-increment *)
external set_page_increment : t -> float -> unit = "ml_gtk_adjustment_set_page_increment"

(** Get property: page-size *)
external get_page_size : t -> float = "ml_gtk_adjustment_get_page_size"

(** Set property: page-size *)
external set_page_size : t -> float -> unit = "ml_gtk_adjustment_set_page_size"

(** Get property: step-increment *)
external get_step_increment : t -> float = "ml_gtk_adjustment_get_step_increment"

(** Set property: step-increment *)
external set_step_increment : t -> float -> unit = "ml_gtk_adjustment_set_step_increment"

(** Get property: upper *)
external get_upper : t -> float = "ml_gtk_adjustment_get_upper"

(** Set property: upper *)
external set_upper : t -> float -> unit = "ml_gtk_adjustment_set_upper"

(** Get property: value *)
external get_value : t -> float = "ml_gtk_adjustment_get_value"

(** Set property: value *)
external set_value : t -> float -> unit = "ml_gtk_adjustment_set_value"

(** Gets the smaller of step increment and page increment. *)
external get_minimum_increment : t -> float = "ml_gtk_adjustment_get_minimum_increment"

(** Sets all properties of the adjustment at once.

Use this function to avoid multiple emissions of the
[signal@Gtk.Adjustment::changed] signal. See
[method@Gtk.Adjustment.set_lower] for an alternative
way of compressing multiple emissions of
[signal@Gtk.Adjustment::changed] into one. *)
external configure : t -> float -> float -> float -> float -> float -> float -> unit = "ml_gtk_adjustment_configure_bytecode" "ml_gtk_adjustment_configure_native"

(** Updates the value property to ensure that the range
between @lower and @upper is in the current page.

The current page goes from `value` to `value` + `page-size`.
If the range is larger than the page size, then only the
start of it will be in the current page.

A [signal@Gtk.Adjustment::value-changed] signal will be emitted
if the value is changed. *)
external clamp_page : t -> float -> float -> unit = "ml_gtk_adjustment_clamp_page"

