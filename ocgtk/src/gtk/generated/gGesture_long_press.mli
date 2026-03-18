class gesture_long_press : Gesture_long_press.t ->
  object
    inherit Ggesture_long_press_signals.gesture_long_press_signals
    method get_delay_factor : unit -> float
    method set_delay_factor : float -> unit
    method as_gesture_long_press : Gesture_long_press.t
  end

