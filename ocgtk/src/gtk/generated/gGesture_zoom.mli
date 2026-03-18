class gesture_zoom : Gesture_zoom.t ->
  object
    inherit Ggesture_zoom_signals.gesture_zoom_signals
    method get_scale_delta : unit -> float
    method as_gesture_zoom : Gesture_zoom.t
  end

