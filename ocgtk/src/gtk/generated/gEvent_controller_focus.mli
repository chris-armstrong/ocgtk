class type event_controller_focus_t = object
    inherit Gevent_controller_focus_signals.event_controller_focus_signals
    method contains_focus : unit -> bool
    method is_focus : unit -> bool
    method as_event_controller_focus : Event_controller_focus.t
end

class event_controller_focus : Event_controller_focus.t -> event_controller_focus_t

