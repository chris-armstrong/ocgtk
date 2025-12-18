(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureSingle *)

type t = [`gesture_single | `gesture | `event_controller | `object_] Gobject.obj

let as_event_controller (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t = Obj.magic obj

(* Properties *)

(** Get property: button *)
external get_button : t -> int = "ml_gtk_gesture_single_get_button"

(** Set property: button *)
external set_button : t -> int -> unit = "ml_gtk_gesture_single_set_button"

(** Get property: exclusive *)
external get_exclusive : t -> bool = "ml_gtk_gesture_single_get_exclusive"

(** Set property: exclusive *)
external set_exclusive : t -> bool -> unit = "ml_gtk_gesture_single_set_exclusive"

(** Get property: touch-only *)
external get_touch_only : t -> bool = "ml_gtk_gesture_single_get_touch_only"

(** Set property: touch-only *)
external set_touch_only : t -> bool -> unit = "ml_gtk_gesture_single_set_touch_only"

(** Returns the button number currently interacting
with @gesture, or 0 if there is none. *)
external get_current_button : t -> int = "ml_gtk_gesture_single_get_current_button"

