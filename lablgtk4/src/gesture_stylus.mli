(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureStylus *)

type t = EventController.t

(** Create a new GestureStylus *)
external new_ : unit -> t = "ml_gtk_gesture_stylus_new"

(* Properties *)

(** Get property: stylus-only *)
external get_stylus_only : t -> bool = "ml_gtk_gesture_stylus_get_stylus_only"

(** Set property: stylus-only *)
external set_stylus_only : t -> bool -> unit = "ml_gtk_gesture_stylus_set_stylus_only"

external get_device_tool : t -> unit = "ml_gtk_gesture_stylus_get_device_tool"

external get_backlog : t -> unit -> int -> bool = "ml_gtk_gesture_stylus_get_backlog"

external get_axis : t -> unit -> float -> bool = "ml_gtk_gesture_stylus_get_axis"

external get_axes : t -> unit -> unit -> bool = "ml_gtk_gesture_stylus_get_axes"

