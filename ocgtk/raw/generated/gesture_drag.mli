(* GENERATED CODE - DO NOT EDIT *)
(* GestureDrag: GestureDrag *)

(** Recognizes drag gestures.

    The drag operation itself can be tracked throughout the
    {{!Ocgtk.Raw.Gesture_drag.val-on_drag_begin}[Gtk.GestureDrag::drag-begin]},
    {{!Ocgtk.Raw.Gesture_drag.val-on_drag_update}[Gtk.GestureDrag::drag-update]}
    and {{!Ocgtk.Raw.Gesture_drag.val-on_drag_end}[Gtk.GestureDrag::drag-end]}
    signals, and the relevant coordinates can be extracted through
    {{!Ocgtk.Raw.Gesture_drag.val-get_offset}[Gtk.GestureDrag.get_offset]} and
    {{!Ocgtk.Raw.Gesture_drag.val-get_start_point}[Gtk.GestureDrag.get_start_point]}.

    The class built on this module is in {!Ocgtk.Gesture_drag}. *)

type t =
  [ `gesture_drag | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_gesture_drag_get_type"

external new_ : unit -> t = "ml_gtk_gesture_drag_new"
(** Returns a newly created [GtkGesture] that recognizes drags. *)

(* Methods *)

external get_start_point : t -> bool * float * float
  = "ml_gtk_gesture_drag_get_start_point"
(** Gets the point where the drag started.

    If the [gesture] is active, this function returns [true] and fills in [x]
    and [y] with the drag start coordinates, in widget-relative coordinates. *)

external get_offset : t -> bool * float * float
  = "ml_gtk_gesture_drag_get_offset"
(** Gets the offset from the start point.

    If the [gesture] is active, this function returns [true] and fills in [x]
    and [y] with the coordinates of the current point, as an offset to the
    starting drag point. *)

val on_drag_begin :
  ?after:bool ->
  t ->
  callback:(start_x:float -> start_y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted whenever dragging starts. *)

val on_drag_end :
  ?after:bool ->
  t ->
  callback:(offset_x:float -> offset_y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted whenever the dragging is finished. *)

val on_drag_update :
  ?after:bool ->
  t ->
  callback:(offset_x:float -> offset_y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted whenever the dragging point moves. *)
