(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Switch *)

type t = [`switch | `widget | `initially_unowned] Gobject.obj

val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

(** Create a new Switch *)
external new_ : unit -> t = "ml_gtk_switch_new"

(* Properties *)

(** Sets the underlying state of the `GtkSwitch`.

This function is typically called from a [signal@Gtk.Switch::state-set]
signal handler in order to set up delayed state changes.

See [signal@Gtk.Switch::state-set] for details. *)
external set_state : t -> bool -> unit = "ml_gtk_switch_set_state"

(** Changes the state of @self to the desired one. *)
external set_active : t -> bool -> unit = "ml_gtk_switch_set_active"

(** Gets the underlying state of the `GtkSwitch`. *)
external get_state : t -> bool = "ml_gtk_switch_get_state"

(** Gets whether the `GtkSwitch` is in its “on” or “off” state. *)
external get_active : t -> bool = "ml_gtk_switch_get_active"

