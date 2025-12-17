(* Signal class defined in ggesture_click_signals.ml *)

(* High-level class for GestureClick *)
class gesture_click (obj : Gesture_click.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_click.as_event_controller obj)
  inherit Ggesture_click_signals.gesture_click_signals obj

  method as_event_controller = (Gesture_click.as_event_controller obj)
    method as_gesture_click = obj
end

