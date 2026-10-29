(* GENERATED CODE - DO NOT EDIT *)
(* GesturePan: GesturePan *)

(** Recognizes pan gestures.

    These are drags that are locked to happen along one axis. The axis that a
    [GtkGesturePan] handles is defined at construct time, and can be changed
    through
    {{!Ocgtk.Raw.Gesture_pan.val-set_orientation}[Gtk.GesturePan.set_orientation]}.

    When the gesture starts to be recognized, [GtkGesturePan] will attempt to
    determine as early as possible whether the sequence is moving in the
    expected direction, and denying the sequence if this does not happen.

    Once a panning gesture along the expected axis is recognized, the
    {{!Ocgtk.Raw.Gesture_pan.val-on_pan}[Gtk.GesturePan::pan]} signal will be
    emitted as input events are received, containing the offset in the given
    axis.

    The class built on this module is in {!Ocgtk.Gesture_pan}. *)

type t =
  [ `gesture_pan
  | `gesture_drag
  | `gesture_single
  | `gesture
  | `event_controller
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_gesture_pan_get_type"

external new_ : Ocgtk_enums.orientation -> t = "ml_gtk_gesture_pan_new"
(** Returns a newly created [GtkGesture] that recognizes pan gestures. *)

(* Methods *)

external set_orientation : t -> Ocgtk_enums.orientation -> unit
  = "ml_gtk_gesture_pan_set_orientation"
(** Sets the orientation to be expected on pan gestures. *)

external get_orientation : t -> Ocgtk_enums.orientation
  = "ml_gtk_gesture_pan_get_orientation"
(** Returns the orientation of the pan gestures that this [gesture] expects. *)

(* Properties *)

val on_pan :
  ?after:bool ->
  t ->
  callback:(direction:Ocgtk_enums.pandirection -> offset:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted once a panning gesture along the expected axis is detected. *)
