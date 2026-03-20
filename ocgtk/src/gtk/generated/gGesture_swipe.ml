(* Signal class defined in ggesture_swipe_signals.ml *)

class type gesture_swipe_t = object
    inherit Ggesture_swipe_signals.gesture_swipe_signals
    method as_gesture_swipe : Gesture_swipe.t
end

(* High-level class for GestureSwipe *)
class gesture_swipe (obj : Gesture_swipe.t) : gesture_swipe_t = object (self)
  inherit Ggesture_swipe_signals.gesture_swipe_signals obj

    method as_gesture_swipe = obj
end

