(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureZoom *)

type t = [`gesture_zoom | `gesture | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(** Create a new GestureZoom *)
external new_ : unit -> t = "ml_gtk_gesture_zoom_new"

(* Methods *)
(** Gets the scale delta.

If @gesture is active, this function returns the zooming
difference since the gesture was recognized (hence the
starting point is considered 1:1). If @gesture is not
active, 1 is returned. *)
external get_scale_delta : t -> float = "ml_gtk_gesture_zoom_get_scale_delta"

