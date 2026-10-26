class type motion_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method as_motion_event : Motion_event.t
end

class motion_event : Motion_event.t -> motion_event_t
