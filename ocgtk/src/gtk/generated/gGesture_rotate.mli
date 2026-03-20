class type gesture_rotate_t = object
    inherit Ggesture_rotate_signals.gesture_rotate_signals
    method get_angle_delta : unit -> float
    method as_gesture_rotate : Gesture_rotate.t
end

class gesture_rotate : Gesture_rotate.t -> gesture_rotate_t

