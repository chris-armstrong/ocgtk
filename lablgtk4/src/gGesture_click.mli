class gesture_click : Gesture_click.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_click_signals.gesture_click_signals
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_click : Gesture_click.t
  end

