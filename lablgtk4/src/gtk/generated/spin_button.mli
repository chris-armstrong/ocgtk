(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SpinButton *)

type t = [`spin_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new SpinButton *)
external new_ : Adjustment.t option -> float -> int -> t = "ml_gtk_spin_button_new"

(** Create a new SpinButton *)
external new_with_range : float -> float -> float -> t = "ml_gtk_spin_button_new_with_range"

(* Methods *)
(** Manually force an update of the spin button. *)
external update : t -> unit = "ml_gtk_spin_button_update"

(** Increment or decrement a spin button’s value in a specified
direction by a specified amount. *)
external spin : t -> Gtk_enums.spintype -> float -> unit = "ml_gtk_spin_button_spin"

(** Sets the flag that determines if a spin button value wraps
around to the opposite limit when the upper or lower limit
of the range is exceeded. *)
external set_wrap : t -> bool -> unit = "ml_gtk_spin_button_set_wrap"

(** Sets the value of @spin_button. *)
external set_value : t -> float -> unit = "ml_gtk_spin_button_set_value"

(** Sets the update behavior of a spin button.

This determines whether the spin button is always
updated or only when a valid value is set. *)
external set_update_policy : t -> Gtk_enums.spinbuttonupdatepolicy -> unit = "ml_gtk_spin_button_set_update_policy"

(** Sets the policy as to whether values are corrected to the
nearest step increment when a spin button is activated after
providing an invalid value. *)
external set_snap_to_ticks : t -> bool -> unit = "ml_gtk_spin_button_set_snap_to_ticks"

(** Sets the minimum and maximum allowable values for @spin_button.

If the current value is outside this range, it will be adjusted
to fit within the range, otherwise it will remain unchanged. *)
external set_range : t -> float -> float -> unit = "ml_gtk_spin_button_set_range"

(** Sets the flag that determines if non-numeric text can be typed
into the spin button. *)
external set_numeric : t -> bool -> unit = "ml_gtk_spin_button_set_numeric"

(** Sets the step and page increments for spin_button.

This affects how quickly the value changes when
the spin button’s arrows are activated. *)
external set_increments : t -> float -> float -> unit = "ml_gtk_spin_button_set_increments"

(** Set the precision to be displayed by @spin_button.

Up to 20 digit precision is allowed. *)
external set_digits : t -> int -> unit = "ml_gtk_spin_button_set_digits"

(** Sets the acceleration rate for repeated changes when you
hold down a button or key. *)
external set_climb_rate : t -> float -> unit = "ml_gtk_spin_button_set_climb_rate"

(** Replaces the `GtkAdjustment` associated with @spin_button. *)
external set_adjustment : t -> Adjustment.t -> unit = "ml_gtk_spin_button_set_adjustment"

(** Sets whether activating the spin button will activate the default
widget for the window containing the spin button.

See [signal@Gtk.SpinButton::activate] for what counts as activation. *)
external set_activates_default : t -> bool -> unit = "ml_gtk_spin_button_set_activates_default"

(** Returns whether the spin button’s value wraps around to the
opposite limit when the upper or lower limit of the range is
exceeded. *)
external get_wrap : t -> bool = "ml_gtk_spin_button_get_wrap"

(** Get the value @spin_button represented as an integer. *)
external get_value_as_int : t -> int = "ml_gtk_spin_button_get_value_as_int"

(** Get the value in the @spin_button. *)
external get_value : t -> float = "ml_gtk_spin_button_get_value"

(** Gets the update behavior of a spin button.

See [method@Gtk.SpinButton.set_update_policy]. *)
external get_update_policy : t -> Gtk_enums.spinbuttonupdatepolicy = "ml_gtk_spin_button_get_update_policy"

(** Returns whether the values are corrected to the nearest step. *)
external get_snap_to_ticks : t -> bool = "ml_gtk_spin_button_get_snap_to_ticks"

(** Gets the range allowed for @spin_button.

See [method@Gtk.SpinButton.set_range]. *)
external get_range : t -> float * float = "ml_gtk_spin_button_get_range"

(** Returns whether non-numeric text can be typed into the spin button. *)
external get_numeric : t -> bool = "ml_gtk_spin_button_get_numeric"

(** Gets the current step and page the increments
used by @spin_button.

See [method@Gtk.SpinButton.set_increments]. *)
external get_increments : t -> float * float = "ml_gtk_spin_button_get_increments"

(** Fetches the precision of @spin_button. *)
external get_digits : t -> int = "ml_gtk_spin_button_get_digits"

(** Returns the acceleration rate for repeated changes. *)
external get_climb_rate : t -> float = "ml_gtk_spin_button_get_climb_rate"

(** Get the adjustment associated with a `GtkSpinButton`. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_spin_button_get_adjustment"

(** Retrieves the value set by [method@Gtk.SpinButton.set_activates_default]. *)
external get_activates_default : t -> bool = "ml_gtk_spin_button_get_activates_default"

(** Changes the properties of an existing spin button.

The adjustment, climb rate, and number of decimal places
are updated accordingly. *)
external configure : t -> Adjustment.t option -> float -> int -> unit = "ml_gtk_spin_button_configure"

(* Properties *)

