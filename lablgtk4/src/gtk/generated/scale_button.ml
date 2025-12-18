(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ScaleButton *)

type t = [`scale_button | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new ScaleButton *)
external new_ : float -> float -> float -> unit -> t = "ml_gtk_scale_button_new"

(* Properties *)

(** Sets the current value of the scale.

If the value is outside the minimum or maximum range values,
it will be clamped to fit inside them.

The scale button emits the [signal@Gtk.ScaleButton::value-changed]
signal if the value changes. *)
external set_value : t -> float -> unit = "ml_gtk_scale_button_set_value"

(** Sets the style of the button. *)
external set_has_frame : t -> bool -> unit = "ml_gtk_scale_button_set_has_frame"

(** Sets the `GtkAdjustment` to be used as a model
for the `GtkScaleButton`’s scale.

See [method@Gtk.Range.set_adjustment] for details. *)
external set_adjustment : t -> Adjustment.t -> unit = "ml_gtk_scale_button_set_adjustment"

(** Gets the current value of the scale button. *)
external get_value : t -> float = "ml_gtk_scale_button_get_value"

(** Retrieves the popup of the `GtkScaleButton`. *)
external get_popup : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scale_button_get_popup"

(** Retrieves the plus button of the `GtkScaleButton.` *)
external get_plus_button : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scale_button_get_plus_button"

(** Retrieves the minus button of the `GtkScaleButton`. *)
external get_minus_button : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scale_button_get_minus_button"

(** Returns whether the button has a frame. *)
external get_has_frame : t -> bool = "ml_gtk_scale_button_get_has_frame"

(** Gets the `GtkAdjustment` associated with the `GtkScaleButton`’s scale.

See [method@Gtk.Range.get_adjustment] for details. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_scale_button_get_adjustment"

(** Queries a `GtkScaleButton` and returns its current state.

Returns %TRUE if the scale button is pressed in and %FALSE
if it is raised. *)
external get_active : t -> bool = "ml_gtk_scale_button_get_active"

