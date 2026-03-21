class type event_controller_motion_t = object
    inherit Gevent_controller_motion_signals.event_controller_motion_signals
    method contains_pointer : unit -> bool
    method is_pointer : unit -> bool
    method as_event_controller_motion : Event_controller_motion.t
end

class event_controller_motion : Event_controller_motion.t -> event_controller_motion_t

