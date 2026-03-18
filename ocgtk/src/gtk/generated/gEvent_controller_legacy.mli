class event_controller_legacy : Event_controller_legacy.t ->
  object
    inherit Gevent_controller_legacy_signals.event_controller_legacy_signals
    method as_event_controller_legacy : Event_controller_legacy.t
  end

