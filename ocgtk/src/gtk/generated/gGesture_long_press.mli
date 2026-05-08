class type gesture_long_press_t = object
  inherit GGesture_single.gesture_single_t
  method on_cancelled : callback:(unit -> unit) -> Gobject.Signal.handler_id

  method on_pressed :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method get_delay_factor : unit -> float
  method set_delay_factor : float -> unit
  method as_gesture_long_press : Gesture_long_press.t
end

class gesture_long_press : Gesture_long_press.t -> gesture_long_press_t

val new_ : unit -> gesture_long_press_t
