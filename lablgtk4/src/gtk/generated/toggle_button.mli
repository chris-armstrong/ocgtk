(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ToggleButton *)

type t = [`toggle_button | `button | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new ToggleButton *)
external new_ : unit -> t = "ml_gtk_toggle_button_new"

(** Create a new ToggleButton *)
external new_with_label : string -> t = "ml_gtk_toggle_button_new_with_label"

(** Create a new ToggleButton *)
external new_with_mnemonic : string -> t = "ml_gtk_toggle_button_new_with_mnemonic"

(* Properties *)

(** Emits the ::toggled signal on the `GtkToggleButton`. *)
external toggled : t -> unit = "ml_gtk_toggle_button_toggled"

(** Adds @self to the group of @group.

In a group of multiple toggle buttons, only one button can be active
at a time.

Setting up groups in a cycle leads to undefined behavior.

Note that the same effect can be achieved via the [iface@Gtk.Actionable]
API, by using the same action with parameter type and state type 's'
for all buttons in the group, and giving each button its own target
value. *)
external set_group : t -> t option -> unit = "ml_gtk_toggle_button_set_group"

(** Sets the status of the toggle button.

Set to %TRUE if you want the `GtkToggleButton` to be “pressed in”,
and %FALSE to raise it.

If the status of the button changes, this action causes the
[signal@Gtk.ToggleButton::toggled] signal to be emitted. *)
external set_active : t -> bool -> unit = "ml_gtk_toggle_button_set_active"

(** Queries a `GtkToggleButton` and returns its current state.

Returns %TRUE if the toggle button is pressed in and %FALSE
if it is raised. *)
external get_active : t -> bool = "ml_gtk_toggle_button_get_active"

