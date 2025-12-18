class event_controller_legacy : Event_controller_legacy.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller
    inherit Gevent_controller_legacy_signals.event_controller_legacy_signals
  method as_event_controller : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t
    method as_event_controller_legacy : Event_controller_legacy.t
  end

