(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureSwipe *)

type t = [`gesture_swipe | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new GestureSwipe *)
external new_ : unit -> t = "ml_gtk_gesture_swipe_new"

(* Methods *)
(** Gets the current velocity.

If the gesture is recognized, this function returns %TRUE and fills
in @velocity_x and @velocity_y with the recorded velocity, as per the
last events processed. *)
external get_velocity : t -> bool * float * float = "ml_gtk_gesture_swipe_get_velocity"

