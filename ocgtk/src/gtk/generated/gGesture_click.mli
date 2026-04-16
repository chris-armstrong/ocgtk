class type gesture_click_t = object
  inherit GGesture_single.gesture_single_t
  inherit Ggesture_click_signals.gesture_click_signals
  method as_gesture_click : Gesture_click.t
end

class gesture_click : Gesture_click.t -> gesture_click_t

val new_ : unit -> gesture_click_t
