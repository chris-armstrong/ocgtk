class gesture_single : Gesture_single.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    method button : int
    method set_button : int -> unit
    method exclusive : bool
    method set_exclusive : bool -> unit
    method touch_only : bool
    method set_touch_only : bool -> unit
    method get_current_button : unit -> int
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_single : Gesture_single.t
  end

