(* GENERATED CODE - DO NOT EDIT *)
(* GestureZoom: GestureZoom *)

type t = [ `gesture_zoom | `gesture | `event_controller | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_gesture_zoom_new"
(** Create a new GestureZoom *)

(* Methods *)

external get_scale_delta : t -> float = "ml_gtk_gesture_zoom_get_scale_delta"
(** Gets the scale delta.

If @gesture is active, this function returns the zooming
difference since the gesture was recognized (hence the
starting point is considered 1:1). If @gesture is not
active, 1 is returned. *)
