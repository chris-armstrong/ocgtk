(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureClick *)

type t = [`gesture_click | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new GestureClick *)
external new_ : unit -> t = "ml_gtk_gesture_click_new"

(* Methods *)
