(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureDrag *)

type t = EventController.t

(** Create a new GestureDrag *)
external new_ : unit -> t = "ml_gtk_gesture_drag_new"

external get_start_point : t -> float -> float -> bool = "ml_gtk_gesture_drag_get_start_point"

external get_offset : t -> float -> float -> bool = "ml_gtk_gesture_drag_get_offset"

