(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureZoom *)

type t = EventController.t

(** Create a new GestureZoom *)
external new_ : unit -> t = "ml_gtk_gesture_zoom_new"

(** Gets the scale delta.

If @gesture is active, this function returns the zooming
difference since the gesture was recognized (hence the
starting point is considered 1:1). If @gesture is not
active, 1 is returned. *)
external get_scale_delta : t -> float = "ml_gtk_gesture_zoom_get_scale_delta"

