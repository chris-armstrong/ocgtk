(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerFocus *)

type t = EventController.t

(** Create a new EventControllerFocus *)
external new_ : unit -> t = "ml_gtk_event_controller_focus_new"

(* Properties *)

(** Returns %TRUE if focus is within @self, but not one of its children. *)
external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"

(** Returns %TRUE if focus is within @self or one of its children. *)
external contains_focus : t -> bool = "ml_gtk_event_controller_focus_contains_focus"

