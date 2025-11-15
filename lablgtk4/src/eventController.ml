(** GTK4 Event Controller System *)

(** Base event controller type *)
type t = [`eventcontroller] Gobject.obj

(** Propagation phase *)
type propagation_phase = [
  | `NONE
  | `CAPTURE
  | `BUBBLE
  | `TARGET
]

(** Propagation limit *)
type propagation_limit = [
  | `NONE
  | `SAME_NATIVE
]

module Base = struct
  external get_widget : t -> Gtk.widget option = "ml_gtk_event_controller_get_widget"

  external get_propagation_phase : t -> propagation_phase = "ml_gtk_event_controller_get_propagation_phase"
  external set_propagation_phase : t -> propagation_phase -> unit = "ml_gtk_event_controller_set_propagation_phase"

  external get_propagation_limit : t -> propagation_limit = "ml_gtk_event_controller_get_propagation_limit"
  external set_propagation_limit : t -> propagation_limit -> unit = "ml_gtk_event_controller_set_propagation_limit"

  external reset : t -> unit = "ml_gtk_event_controller_reset"

  external get_current_event : t -> Gdk.Event.t option = "ml_gtk_event_controller_get_current_event"

  external get_current_event_time : t -> int = "ml_gtk_event_controller_get_current_event_time"
end
