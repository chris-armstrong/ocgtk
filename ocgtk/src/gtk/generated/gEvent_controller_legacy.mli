class type event_controller_legacy_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gevent_controller_legacy_signals.event_controller_legacy_signals
    method as_event_controller_legacy : Event_controller_legacy.t
end

class event_controller_legacy : Event_controller_legacy.t -> event_controller_legacy_t

