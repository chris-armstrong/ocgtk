class gesture_swipe : Gesture_swipe.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_swipe_signals.gesture_swipe_signals
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_swipe : Gesture_swipe.t
  end

