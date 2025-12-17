(* Signal class defined in ggesture_rotate_signals.ml *)

(* High-level class for GestureRotate *)
class gesture_rotate (obj : Gesture_rotate.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_rotate.as_event_controller obj)
  inherit Ggesture_rotate_signals.gesture_rotate_signals obj

  method get_angle_delta : unit -> float = fun () -> (Gesture_rotate.get_angle_delta obj )

  method as_event_controller = (Gesture_rotate.as_event_controller obj)
    method as_gesture_rotate = obj
end

