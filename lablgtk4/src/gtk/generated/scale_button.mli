(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ScaleButton *)

type t = [`scale_button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ScaleButton *)
external new_ : float -> float -> float -> unit -> t = "ml_gtk_scale_button_new"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_scale_button_get_active"

(** Get property: has-frame *)
external get_has_frame : t -> bool = "ml_gtk_scale_button_get_has_frame"

(** Set property: has-frame *)
external set_has_frame : t -> bool -> unit = "ml_gtk_scale_button_set_has_frame"

(** Get property: value *)
external get_value : t -> float = "ml_gtk_scale_button_get_value"

(** Set property: value *)
external set_value : t -> float -> unit = "ml_gtk_scale_button_set_value"

(** Sets the `GtkAdjustment` to be used as a model
for the `GtkScaleButton`’s scale.

See [method@Gtk.Range.set_adjustment] for details. *)
external set_adjustment : t -> Adjustment.t -> unit = "ml_gtk_scale_button_set_adjustment"

(** Retrieves the popup of the `GtkScaleButton`. *)
external get_popup : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scale_button_get_popup"

(** Retrieves the plus button of the `GtkScaleButton.` *)
external get_plus_button : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scale_button_get_plus_button"

(** Retrieves the minus button of the `GtkScaleButton`. *)
external get_minus_button : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = "ml_gtk_scale_button_get_minus_button"

(** Gets the `GtkAdjustment` associated with the `GtkScaleButton`’s scale.

See [method@Gtk.Range.get_adjustment] for details. *)
external get_adjustment : t -> Adjustment.t = "ml_gtk_scale_button_get_adjustment"

