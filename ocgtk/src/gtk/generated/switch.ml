(* GENERATED CODE - DO NOT EDIT *)
(* Switch: Switch *)

type t = [ `switch | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_switch_new"
(** Create a new Switch *)

(* Methods *)

external set_state : t -> bool -> unit = "ml_gtk_switch_set_state"
(** Sets the underlying state of the `GtkSwitch`.

    This function is typically called from a [signal@Gtk.Switch::state-set]
    signal handler in order to set up delayed state changes.

    See [signal@Gtk.Switch::state-set] for details. *)

external set_active : t -> bool -> unit = "ml_gtk_switch_set_active"
(** Changes the state of @self to the desired one. *)

external get_state : t -> bool = "ml_gtk_switch_get_state"
(** Gets the underlying state of the `GtkSwitch`. *)

external get_active : t -> bool = "ml_gtk_switch_get_active"
(** Gets whether the `GtkSwitch` is in its “on” or “off” state. *)

(* Properties *)
