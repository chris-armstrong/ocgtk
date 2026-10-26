class type grab_broken_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_grab_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  method get_implicit : unit -> bool
  method as_grab_broken_event : Raw.Grab_broken_event.t
end

class grab_broken_event : Raw.Grab_broken_event.t -> grab_broken_event_t
