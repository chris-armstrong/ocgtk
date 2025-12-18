class gesture_long_press : Gesture_long_press.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_long_press_signals.gesture_long_press_signals
    method delay_factor : float
    method set_delay_factor : float -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_long_press : Gesture_long_press.t
  end

