(* High-level class for GestureSingle *)
class gesture_single (obj : Gesture_single.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_single.as_event_controller obj)

  method button = Gesture_single.get_button obj
  method set_button v = Gesture_single.set_button obj v

  method exclusive = Gesture_single.get_exclusive obj
  method set_exclusive v = Gesture_single.set_exclusive obj v

  method touch_only = Gesture_single.get_touch_only obj
  method set_touch_only v = Gesture_single.set_touch_only obj v

  method get_current_button : unit -> int = fun () -> (Gesture_single.get_current_button obj )

  method as_event_controller = (Gesture_single.as_event_controller obj)
    method as_gesture_single = obj
end

