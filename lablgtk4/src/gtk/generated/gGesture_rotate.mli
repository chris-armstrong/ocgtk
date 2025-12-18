class gesture_rotate : Gesture_rotate.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_rotate_signals.gesture_rotate_signals
    method get_angle_delta : unit -> float
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_rotate : Gesture_rotate.t
  end

