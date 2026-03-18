class gesture_drag : Gesture_drag.t ->
  object
    inherit Ggesture_drag_signals.gesture_drag_signals
    method as_gesture_drag : Gesture_drag.t
  end

