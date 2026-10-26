class type motion_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method as_motion_event : Raw.Motion_event.t
end

class motion_event : Raw.Motion_event.t -> motion_event_t
