(* Signal class defined in ggesture_drag_signals.ml *)

class type gesture_drag_t = object
    inherit GGesture_single.gesture_single_t
    inherit Ggesture_drag_signals.gesture_drag_signals
    method as_gesture_drag : Gesture_drag.t
end

(* High-level class for GestureDrag *)
class gesture_drag (obj : Gesture_drag.t) : gesture_drag_t = object (self)
  inherit GGesture_single.gesture_single (obj :> Gesture_single.t)
  inherit Ggesture_drag_signals.gesture_drag_signals obj

    method as_gesture_drag = obj
end

let new_ () : gesture_drag_t =
  new gesture_drag (Gesture_drag.new_ ())

