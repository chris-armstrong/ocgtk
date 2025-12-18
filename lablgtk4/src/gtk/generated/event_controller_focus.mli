(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerFocus *)

type t = [`event_controller_focus | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new EventControllerFocus *)
external new_ : unit -> t = "ml_gtk_event_controller_focus_new"

(* Properties *)

(** Get property: contains-focus *)
external get_contains_focus : t -> bool = "ml_gtk_event_controller_focus_get_contains_focus"

(** Get property: is-focus *)
external get_is_focus : t -> bool = "ml_gtk_event_controller_focus_get_is_focus"

(** Returns %TRUE if focus is within @self, but not one of its children. *)
external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"

(** Returns %TRUE if focus is within @self or one of its children. *)
external contains_focus : t -> bool = "ml_gtk_event_controller_focus_contains_focus"

