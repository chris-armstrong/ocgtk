(* Signal class defined in ggesture_click_signals.ml *)

(* High-level class for GestureClick *)
class gesture_click (obj : Gesture_click.t) = object (self)
  inherit Ggesture_click_signals.gesture_click_signals obj

    method as_gesture_click = obj
end

