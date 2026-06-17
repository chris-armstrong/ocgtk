class type grab_broken_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_grab_surface : unit -> GApp_launch_context_cycle_de440b34.surface_t
  method get_implicit : unit -> bool
  method as_grab_broken_event : Grab_broken_event.t
end

class grab_broken_event : Grab_broken_event.t -> grab_broken_event_t
