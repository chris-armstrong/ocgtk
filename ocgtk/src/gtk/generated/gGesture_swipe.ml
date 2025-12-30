(* Signal class defined in ggesture_swipe_signals.ml *)

(* High-level class for GestureSwipe *)
class gesture_swipe (obj : Gesture_swipe.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_swipe.as_event_controller obj)
  inherit Ggesture_swipe_signals.gesture_swipe_signals obj

  method as_event_controller = (Gesture_swipe.as_event_controller obj)
    method as_gesture_swipe = obj
end

