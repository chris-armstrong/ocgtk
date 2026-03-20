class type motion_event_t = object
    method as_motion_event : Motion_event.t
end

(* High-level class for MotionEvent *)
class motion_event (obj : Motion_event.t) : motion_event_t = object (self)

    method as_motion_event = obj
end

