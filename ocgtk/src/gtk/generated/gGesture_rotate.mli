class gesture_rotate : Gesture_rotate.t ->
  object
    inherit Ggesture_rotate_signals.gesture_rotate_signals
    method get_angle_delta : unit -> float
    method as_gesture_rotate : Gesture_rotate.t
  end

