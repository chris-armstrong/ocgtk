(* Signal class defined in ggesture_drag_signals.ml *)

(* High-level class for GestureDrag *)
class gesture_drag (obj : Gesture_drag.t) = object (self)
  inherit Ggesture_drag_signals.gesture_drag_signals obj

    method as_gesture_drag = obj
end

