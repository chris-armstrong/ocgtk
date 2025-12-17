(* High-level class for GestureSingle *)
class gesture_single (obj : Gesture_single.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_single.as_event_controller obj)

  method get_button : unit -> int = fun () -> (Gesture_single.get_button obj )

  method get_current_button : unit -> int = fun () -> (Gesture_single.get_current_button obj )

  method get_exclusive : unit -> bool = fun () -> (Gesture_single.get_exclusive obj )

  method get_touch_only : unit -> bool = fun () -> (Gesture_single.get_touch_only obj )

  method set_button : int -> unit = fun button -> (Gesture_single.set_button obj button)

  method set_exclusive : bool -> unit = fun exclusive -> (Gesture_single.set_exclusive obj exclusive)

  method set_touch_only : bool -> unit = fun touch_only -> (Gesture_single.set_touch_only obj touch_only)

  method as_event_controller = (Gesture_single.as_event_controller obj)
    method as_gesture_single = obj
end

