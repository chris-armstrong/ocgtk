(* GENERATED CODE - DO NOT EDIT *)
(* GestureDrag: GestureDrag *)

type t =
  [ `gesture_drag | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj
(** Recognizes drag gestures.

    The drag operation itself can be tracked throughout the
    [Gtk.GestureDrag::drag-begin], [Gtk.GestureDrag::drag-update] and
    [Gtk.GestureDrag::drag-end] signals, and the relevant coordinates can be
    extracted through [Gtk.GestureDrag.get_offset] and
    [Gtk.GestureDrag.get_start_point]. *)

external new_ : unit -> t = "ml_gtk_gesture_drag_new"
(** Create a new GestureDrag *)

(* Methods *)

external get_start_point : t -> bool * float * float
  = "ml_gtk_gesture_drag_get_start_point"
(** Gets the point where the drag started.

    If the [gesture] is active, this function returns [TRUE] and fills in [x]
    and [y] with the drag start coordinates, in widget-relative coordinates. *)

external get_offset : t -> bool * float * float
  = "ml_gtk_gesture_drag_get_offset"
(** Gets the offset from the start point.

    If the [gesture] is active, this function returns [TRUE] and fills in [x]
    and [y] with the coordinates of the current point, as an offset to the
    starting drag point. *)

val on_drag_begin :
  ?after:bool ->
  t ->
  callback:(start_x:float -> start_y:float -> unit) ->
  Gobject.Signal.handler_id

val on_drag_end :
  ?after:bool ->
  t ->
  callback:(offset_x:float -> offset_y:float -> unit) ->
  Gobject.Signal.handler_id

val on_drag_update :
  ?after:bool ->
  t ->
  callback:(offset_x:float -> offset_y:float -> unit) ->
  Gobject.Signal.handler_id
