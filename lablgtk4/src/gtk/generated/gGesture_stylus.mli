class gesture_stylus : Gesture_stylus.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Ggesture_stylus_signals.gesture_stylus_signals
    method stylus_only : bool
    method set_stylus_only : bool -> unit
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_gesture_stylus : Gesture_stylus.t
  end

