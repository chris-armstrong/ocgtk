(** Recognizes pan gestures.

    Its methods, signals and properties are on {!class-type-gesture_pan_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_pan}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GesturePan].}

    Recognizes pan gestures.

    These are drags that are locked to happen along one axis. The axis that a
    [GtkGesturePan] handles is defined at construct time, and can be changed
    through [Gtk.GesturePan.set_orientation].

    When the gesture starts to be recognized, [GtkGesturePan] will attempt to
    determine as early as possible whether the sequence is moving in the
    expected direction, and denying the sequence if this does not happen.

    Once a panning gesture along the expected axis is recognized, the
    [Gtk.GesturePan::pan] signal will be emitted as input events are received,
    containing the offset in the given axis. *)
class type gesture_pan_t = object
  inherit Gesture_drag.gesture_drag_t

  method on_pan :
    ?after:bool ->
    callback:(direction:Enums.pandirection -> offset:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted once a panning gesture along the expected axis is detected. *)

  method get_orientation : unit -> Enums.orientation
  (** Returns the orientation of the pan gestures that this [gesture] expects.
  *)

  method set_orientation : Enums.orientation -> unit
  (** Sets the orientation to be expected on pan gestures. *)

  method as_gesture_pan : Raw.Gesture_pan.t
end

class gesture_pan : Raw.Gesture_pan.t -> gesture_pan_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_pan.t}. *)

(** {1:description Description}

    Recognizes pan gestures.

    These are drags that are locked to happen along one axis. The axis that a
    [GtkGesturePan] handles is defined at construct time, and can be changed
    through [Gtk.GesturePan.set_orientation].

    When the gesture starts to be recognized, [GtkGesturePan] will attempt to
    determine as early as possible whether the sequence is moving in the
    expected direction, and denying the sequence if this does not happen.

    Once a panning gesture along the expected axis is recognized, the
    [Gtk.GesturePan::pan] signal will be emitted as input events are received,
    containing the offset in the given axis. *)

(** {1:constructors Constructors} *)

val new_ : Enums.orientation -> gesture_pan_t
(** Returns a newly created [GtkGesture] that recognizes pan gestures. *)
