class gesture_zoom : Gesture_zoom.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_zoom_signals.gesture_zoom_signals
    method get_scale_delta : unit -> float
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_zoom : Gesture_zoom.t
  end

