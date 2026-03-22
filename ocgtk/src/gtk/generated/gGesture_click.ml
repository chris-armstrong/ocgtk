(* Signal class defined in ggesture_click_signals.ml *)

class type gesture_click_t = object
    inherit GGesture_single.gesture_single_t
    inherit Ggesture_click_signals.gesture_click_signals
    method as_gesture_click : Gesture_click.t
end

(* High-level class for GestureClick *)
class gesture_click (obj : Gesture_click.t) : gesture_click_t = object (self)
  inherit GGesture_single.gesture_single (Obj.magic obj : Gesture_single.t)
  inherit Ggesture_click_signals.gesture_click_signals obj

    method as_gesture_click = obj
end

