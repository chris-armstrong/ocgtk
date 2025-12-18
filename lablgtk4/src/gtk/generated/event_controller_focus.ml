(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: EventControllerFocus *)

type t = [`event_controller_focus | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(** Create a new EventControllerFocus *)
external new_ : unit -> t = "ml_gtk_event_controller_focus_new"

(* Properties *)

(** Returns %TRUE if focus is within @self, but not one of its children. *)
external is_focus : t -> bool = "ml_gtk_event_controller_focus_is_focus"

(** Returns %TRUE if focus is within @self or one of its children. *)
external contains_focus : t -> bool = "ml_gtk_event_controller_focus_contains_focus"

