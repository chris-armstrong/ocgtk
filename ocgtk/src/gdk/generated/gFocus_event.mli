class type focus_event_t = object
    method get_in : unit -> bool
    method as_focus_event : Focus_event.t
end

class focus_event : Focus_event.t -> focus_event_t

