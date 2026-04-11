(* GENERATED CODE - DO NOT EDIT *)
(* GestureDrag: GestureDrag *)

type t = [`gesture_drag | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

(** Create a new GestureDrag *)
external new_ : unit -> t = "ml_gtk_gesture_drag_new"

(* Methods *)
(** Gets the point where the drag started.

If the @gesture is active, this function returns %TRUE
and fills in @x and @y with the drag start coordinates,
in widget-relative coordinates. *)
external get_start_point : t -> bool * float * float = "ml_gtk_gesture_drag_get_start_point"

(** Gets the offset from the start point.

If the @gesture is active, this function returns %TRUE and
fills in @x and @y with the coordinates of the current point,
as an offset to the starting drag point. *)
external get_offset : t -> bool * float * float = "ml_gtk_gesture_drag_get_offset"

