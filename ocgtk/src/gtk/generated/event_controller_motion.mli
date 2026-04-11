(* GENERATED CODE - DO NOT EDIT *)
(* EventControllerMotion: EventControllerMotion *)

type t = [ `event_controller_motion | `event_controller | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_event_controller_motion_new"
(** Create a new EventControllerMotion *)

(* Methods *)

external is_pointer : t -> bool = "ml_gtk_event_controller_motion_is_pointer"
(** Returns if a pointer is within @self, but not one of its children. *)

external contains_pointer : t -> bool
  = "ml_gtk_event_controller_motion_contains_pointer"
(** Returns if a pointer is within @self or one of its children. *)

(* Properties *)
