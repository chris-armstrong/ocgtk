(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureRotate *)

type t = EventController.t

(** Create a new GestureRotate *)
external new_ : unit -> t = "ml_gtk_gesture_rotate_new"

(** Gets the angle delta in radians.

If @gesture is active, this function returns the angle difference
in radians since the gesture was first recognized. If @gesture is
not active, 0 is returned. *)
external get_angle_delta : t -> float = "ml_gtk_gesture_rotate_get_angle_delta"

