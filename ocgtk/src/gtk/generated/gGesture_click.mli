class gesture_click : Gesture_click.t ->
  object
    inherit Ggesture_click_signals.gesture_click_signals
    method as_gesture_click : Gesture_click.t
  end

