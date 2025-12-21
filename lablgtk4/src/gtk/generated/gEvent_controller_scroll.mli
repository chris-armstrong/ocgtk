class event_controller_scroll : Event_controller_scroll.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gevent_controller_scroll_signals.event_controller_scroll_signals
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_event_controller_scroll : Event_controller_scroll.t
  end

