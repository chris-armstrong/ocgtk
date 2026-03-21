class type event_controller_legacy_t = object
    inherit Gevent_controller_legacy_signals.event_controller_legacy_signals
    method as_event_controller_legacy : Event_controller_legacy.t
end

class event_controller_legacy : Event_controller_legacy.t -> event_controller_legacy_t

