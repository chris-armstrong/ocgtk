(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventController *)

type t = EventController.t

(* Properties *)

(** Sets a name on the controller that can be used for debugging. *)
external set_static_name : t -> string option -> unit = "ml_gtk_event_controller_set_static_name"

(** Sets the propagation phase at which a controller handles events.

If @phase is %GTK_PHASE_NONE, no automatic event handling will be
performed, but other additional gesture maintenance will. *)
external set_propagation_phase : t -> Gtk_enums.propagationphase -> unit = "ml_gtk_event_controller_set_propagation_phase"

(** Sets the event propagation limit on the event controller.

If the limit is set to %GTK_LIMIT_SAME_NATIVE, the controller
won't handle events that are targeted at widgets on a different
surface, such as popovers. *)
external set_propagation_limit : t -> Gtk_enums.propagationlimit -> unit = "ml_gtk_event_controller_set_propagation_limit"

(** Sets a name on the controller that can be used for debugging. *)
external set_name : t -> string option -> unit = "ml_gtk_event_controller_set_name"

(** Resets the @controller to a clean state. *)
external reset : t -> unit = "ml_gtk_event_controller_reset"

(** Returns the `GtkWidget` this controller relates to. *)
external get_widget : t -> Gtk.widget = "ml_gtk_event_controller_get_widget"

(** Gets the propagation phase at which @controller handles events. *)
external get_propagation_phase : t -> Gtk_enums.propagationphase = "ml_gtk_event_controller_get_propagation_phase"

(** Gets the propagation limit of the event controller. *)
external get_propagation_limit : t -> Gtk_enums.propagationlimit = "ml_gtk_event_controller_get_propagation_limit"

(** Gets the name of @controller. *)
external get_name : t -> string option = "ml_gtk_event_controller_get_name"

(** Returns the modifier state of the event that is currently being
handled by the controller.

At other times, 0 is returned. *)
external get_current_event_state : t -> Gdk.modifiertype = "ml_gtk_event_controller_get_current_event_state"

(** Returns the event that is currently being handled by the controller.

At other times, %NULL is returned. *)
external get_current_event : t -> _ Gdk.event option = "ml_gtk_event_controller_get_current_event"

