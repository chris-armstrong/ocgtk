class type touch_event_t = object
    method get_emulating_pointer : unit -> bool
    method as_touch_event : Touch_event.t
end

class touch_event : Touch_event.t -> touch_event_t

