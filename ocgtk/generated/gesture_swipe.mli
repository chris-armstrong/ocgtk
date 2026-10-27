(** Recognizes swipe gestures.

    After a press/move/.../move/release sequence happens, the
    [Gtk.GestureSwipe::swipe] signal will be emitted, providing the velocity and
    directionality of the sequence at the time it was lifted.

    If the velocity is desired in intermediate points,
    [Gtk.GestureSwipe.get_velocity] can be called in a [Gtk.Gesture::update]
    handler.

    All velocities are reported in pixels/sec units.

    Its methods, signals and properties are on {!class-type-gesture_swipe_t}.
    The functions it is built on are in {!Ocgtk.Raw.Gesture_swipe}. *)

(** The methods, signals and properties of a [GtkGestureSwipe]. *)
class type gesture_swipe_t = object
  inherit Gesture_single.gesture_single_t

  method on_swipe :
    ?after:bool ->
    callback:(velocity_x:float -> velocity_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_gesture_swipe : Raw.Gesture_swipe.t
end

class gesture_swipe : Raw.Gesture_swipe.t -> gesture_swipe_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_swipe.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGestureSwipe], give one already wrapped. *)

val new_ : unit -> gesture_swipe_t
