(* Signal class defined in ggesture_zoom_signals.ml *)

(* High-level class for GestureZoom *)
class gesture_zoom (obj : Gesture_zoom.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_zoom.as_event_controller obj)
  inherit Ggesture_zoom_signals.gesture_zoom_signals obj

  method get_scale_delta : unit -> float = fun () -> (Gesture_zoom.get_scale_delta obj )

  method as_event_controller = (Gesture_zoom.as_event_controller obj)
    method as_gesture_zoom = obj
end

