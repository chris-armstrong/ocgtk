(** Recognizes pan gestures.

    These are drags that are locked to happen along one axis. The axis that a
    [GtkGesturePan] handles is defined at construct time, and can be changed
    through [Gtk.GesturePan.set_orientation].

    When the gesture starts to be recognized, [GtkGesturePan] will attempt to
    determine as early as possible whether the sequence is moving in the
    expected direction, and denying the sequence if this does not happen.

    Once a panning gesture along the expected axis is recognized, the
    [Gtk.GesturePan::pan] signal will be emitted as input events are received,
    containing the offset in the given axis.

    Its methods, signals and properties are on {!class-type-gesture_pan_t}. The
    functions it is built on are in {!Ocgtk.Raw.Gesture_pan}. *)

(** The methods, signals and properties of a [GtkGesturePan]. *)
class type gesture_pan_t = object
  inherit Gesture_drag.gesture_drag_t

  method on_pan :
    ?after:bool ->
    callback:(direction:Enums.pandirection -> offset:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_orientation : unit -> Enums.orientation
  method set_orientation : Enums.orientation -> unit
  method as_gesture_pan : Raw.Gesture_pan.t
end

class gesture_pan : Raw.Gesture_pan.t -> gesture_pan_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_pan.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGesturePan], give one already wrapped. *)

val new_ : Enums.orientation -> gesture_pan_t
