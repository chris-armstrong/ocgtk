(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerMotion *)

type t = EventController.t

(** Create a new EventControllerMotion *)
external new_ : unit -> t = "ml_gtk_event_controller_motion_new"

(* Properties *)

(** Returns if a pointer is within @self, but not one of its children. *)
external is_pointer : t -> bool = "ml_gtk_event_controller_motion_is_pointer"

(** Returns if a pointer is within @self or one of its children. *)
external contains_pointer : t -> bool = "ml_gtk_event_controller_motion_contains_pointer"

