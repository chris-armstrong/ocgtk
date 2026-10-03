(* GENERATED CODE - DO NOT EDIT *)
(* GesturePan: GesturePan *)

type t =
  [ `gesture_pan
  | `gesture_drag
  | `gesture_single
  | `gesture
  | `event_controller
  | `object_ ]
  Gobject.obj
(** Recognizes pan gestures.

    These are drags that are locked to happen along one axis. The axis that a
    [GtkGesturePan] handles is defined at construct time, and can be changed
    through [Gtk.GesturePan.set_orientation].

    When the gesture starts to be recognized, [GtkGesturePan] will attempt to
    determine as early as possible whether the sequence is moving in the
    expected direction, and denying the sequence if this does not happen.

    Once a panning gesture along the expected axis is recognized, the
    [Gtk.GesturePan::pan] signal will be emitted as input events are received,
    containing the offset in the given axis. *)

external new_ : Gtk_enums.orientation -> t = "ml_gtk_gesture_pan_new"
(** Create a new GesturePan *)

(* Methods *)

external set_orientation : t -> Gtk_enums.orientation -> unit
  = "ml_gtk_gesture_pan_set_orientation"
(** Sets the orientation to be expected on pan gestures. *)

external get_orientation : t -> Gtk_enums.orientation
  = "ml_gtk_gesture_pan_get_orientation"
(** Returns the orientation of the pan gestures that this [gesture] expects. *)

(* Properties *)

val on_pan :
  ?after:bool ->
  t ->
  callback:(direction:Gtk_enums.pandirection -> offset:float -> unit) ->
  Gobject.Signal.handler_id
