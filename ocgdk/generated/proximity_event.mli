class type proximity_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method as_proximity_event : Proximity_event.t
end

class proximity_event : Proximity_event.t -> proximity_event_t
