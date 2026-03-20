class type gesture_long_press_t = object
    inherit Ggesture_long_press_signals.gesture_long_press_signals
    method get_delay_factor : unit -> float
    method set_delay_factor : float -> unit
    method as_gesture_long_press : Gesture_long_press.t
end

class gesture_long_press : Gesture_long_press.t -> gesture_long_press_t

