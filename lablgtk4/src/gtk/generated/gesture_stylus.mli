(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureStylus *)

type t = [`gesture_stylus | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new GestureStylus *)
external new_ : unit -> t = "ml_gtk_gesture_stylus_new"

(* Properties *)

(** Get property: stylus-only *)
external get_stylus_only : t -> bool = "ml_gtk_gesture_stylus_get_stylus_only"

(** Set property: stylus-only *)
external set_stylus_only : t -> bool -> unit = "ml_gtk_gesture_stylus_set_stylus_only"

