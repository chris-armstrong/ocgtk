(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventController *)

type t = EventController.t

(* Properties *)

external set_static_name : t -> string option -> unit = "ml_gtk_event_controller_set_static_name"

external set_propagation_phase : t -> propagationphase -> unit = "ml_gtk_event_controller_set_propagation_phase"

external set_propagation_limit : t -> propagationlimit -> unit = "ml_gtk_event_controller_set_propagation_limit"

external set_name : t -> string option -> unit = "ml_gtk_event_controller_set_name"

external reset : t -> unit = "ml_gtk_event_controller_reset"

external get_widget : t -> Gtk.Widget.t = "ml_gtk_event_controller_get_widget"

external get_propagation_phase : t -> propagationphase = "ml_gtk_event_controller_get_propagation_phase"

external get_propagation_limit : t -> propagationlimit = "ml_gtk_event_controller_get_propagation_limit"

external get_name : t -> string = "ml_gtk_event_controller_get_name"

external get_current_event_time : t -> unit = "ml_gtk_event_controller_get_current_event_time"

external get_current_event_state : t -> modifiertype = "ml_gtk_event_controller_get_current_event_state"

external get_current_event_device : t -> unit = "ml_gtk_event_controller_get_current_event_device"

external get_current_event : t -> Gdk.Event.t = "ml_gtk_event_controller_get_current_event"

