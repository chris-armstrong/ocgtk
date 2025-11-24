(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventController *)

type t = EventController.t

(* Properties *)

external get_name : t -> string = "ml_gtk_event_controller_get_name"

external set_name : t -> string -> unit = "ml_gtk_event_controller_set_name"

external set_static_name : t -> string option -> unit = "ml_gtk_event_controller_set_static_name"

external set_propagation_phase : t -> Gtk_enums.propagationphase -> unit = "ml_gtk_event_controller_set_propagation_phase"

external set_propagation_limit : t -> Gtk_enums.propagationlimit -> unit = "ml_gtk_event_controller_set_propagation_limit"

external reset : t -> unit = "ml_gtk_event_controller_reset"

external get_widget : t -> Gtk.Widget.t = "ml_gtk_event_controller_get_widget"

external get_propagation_phase : t -> Gtk_enums.propagationphase = "ml_gtk_event_controller_get_propagation_phase"

external get_propagation_limit : t -> Gtk_enums.propagationlimit = "ml_gtk_event_controller_get_propagation_limit"

external get_current_event_state : t -> Gdk.modifiertype = "ml_gtk_event_controller_get_current_event_state"

external get_current_event : t -> _ Gdk.event = "ml_gtk_event_controller_get_current_event"

