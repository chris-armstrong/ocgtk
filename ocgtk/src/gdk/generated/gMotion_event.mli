class type motion_event_t = object
    method as_motion_event : Motion_event.t
end

class motion_event : Motion_event.t -> motion_event_t

