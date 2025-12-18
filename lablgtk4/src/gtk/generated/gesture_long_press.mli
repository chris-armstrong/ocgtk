(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureLongPress *)

type t = [`gesture_long_press | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new GestureLongPress *)
external new_ : unit -> t = "ml_gtk_gesture_long_press_new"

(* Properties *)

(** Get property: delay-factor *)
external get_delay_factor : t -> float = "ml_gtk_gesture_long_press_get_delay_factor"

(** Set property: delay-factor *)
external set_delay_factor : t -> float -> unit = "ml_gtk_gesture_long_press_set_delay_factor"

