(* GENERATED CODE - DO NOT EDIT *)
(* GestureRotate: GestureRotate *)

type t =
  [ `gesture_rotate | `gesture | `event_controller | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_gesture_rotate_new"
(** Create a new GestureRotate *)

(* Methods *)

external get_angle_delta : t -> float = "ml_gtk_gesture_rotate_get_angle_delta"
(** Gets the angle delta in radians.

If @gesture is active, this function returns the angle difference
in radians since the gesture was first recognized. If @gesture is
not active, 0 is returned. *)
