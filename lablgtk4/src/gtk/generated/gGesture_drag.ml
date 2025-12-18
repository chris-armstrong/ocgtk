(* Signal class defined in ggesture_drag_signals.ml *)

(* High-level class for GestureDrag *)
class gesture_drag (obj : Gesture_drag.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_drag.as_event_controller obj)
  inherit Ggesture_drag_signals.gesture_drag_signals obj

  method as_event_controller = (Gesture_drag.as_event_controller obj)
    method as_gesture_drag = obj
end

