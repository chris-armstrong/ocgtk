(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerMotion *)

type t = EventController.t

(** Create a new EventControllerMotion *)
external new_ : unit -> t = "ml_gtk_event_controller_motion_new"

(* Properties *)

(** Get property: contains-pointer *)
external get_contains_pointer : t -> bool = "ml_gtk_event_controller_motion_get_contains_pointer"

(** Get property: is-pointer *)
external get_is_pointer : t -> bool = "ml_gtk_event_controller_motion_get_is_pointer"

external is_pointer : t -> bool = "ml_gtk_event_controller_motion_is_pointer"

external contains_pointer : t -> bool = "ml_gtk_event_controller_motion_contains_pointer"

