class gesture_swipe : Gesture_swipe.t ->
  object
    inherit Ggesture_swipe_signals.gesture_swipe_signals
    method as_gesture_swipe : Gesture_swipe.t
  end

