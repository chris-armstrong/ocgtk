class type gesture_swipe_t = object
    inherit Ggesture_swipe_signals.gesture_swipe_signals
    method as_gesture_swipe : Gesture_swipe.t
end

class gesture_swipe : Gesture_swipe.t -> gesture_swipe_t

