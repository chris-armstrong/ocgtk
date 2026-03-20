(* Signal class defined in ggesture_drag_signals.ml *)

class type gesture_drag_t = object
    inherit Ggesture_drag_signals.gesture_drag_signals
    method as_gesture_drag : Gesture_drag.t
end

(* High-level class for GestureDrag *)
class gesture_drag (obj : Gesture_drag.t) : gesture_drag_t = object (self)
  inherit Ggesture_drag_signals.gesture_drag_signals obj

    method as_gesture_drag = obj
end

