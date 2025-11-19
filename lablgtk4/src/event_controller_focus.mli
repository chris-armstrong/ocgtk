(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerFocus *)

type t = EventController.t

(** Create a new EventControllerFocus *)
external new_ : unit -> t = "ml_gtk_event_controller_focus_new"

(* Properties *)

(** Get property: contains-focus *)
external get_contains_focus : t -> bool = "ml_gtk_event_controller_focus_get_contains_focus"

(** Get property: is-focus *)
external get_is_focus : t -> bool = "ml_gtk_event_controller_focus_get_is_focus"

external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"

external contains_focus : t -> bool = "ml_gtk_event_controller_focus_contains_focus"

