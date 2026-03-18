(* Signal class defined in ggesture_swipe_signals.ml *)

(* High-level class for GestureSwipe *)
class gesture_swipe (obj : Gesture_swipe.t) = object (self)
  inherit Ggesture_swipe_signals.gesture_swipe_signals obj

    method as_gesture_swipe = obj
end

