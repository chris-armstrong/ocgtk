(** Recognizes 2-finger rotation gestures.

    Whenever the angle between both handled sequences changes, the
    [Gtk.GestureRotate::angle-changed] signal is emitted.

    Its methods, signals and properties are on {!class-type-gesture_rotate_t}.
    The functions it is built on are in {!Ocgtk.Raw.Gesture_rotate}. *)

(** The methods, signals and properties of a [GtkGestureRotate]. *)
class type gesture_rotate_t = object
  inherit Gesture.gesture_t

  method on_angle_changed :
    ?after:bool ->
    callback:(angle:float -> angle_delta:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_angle_delta : unit -> float
  method as_gesture_rotate : Raw.Gesture_rotate.t
end

class gesture_rotate : Raw.Gesture_rotate.t -> gesture_rotate_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_rotate.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkGestureRotate], give one already wrapped. *)

val new_ : unit -> gesture_rotate_t
