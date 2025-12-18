class event_controller_focus : Event_controller_focus.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gevent_controller_focus_signals.event_controller_focus_signals
    method contains_focus : bool
    method is_focus : bool
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_event_controller_focus : Event_controller_focus.t
  end

