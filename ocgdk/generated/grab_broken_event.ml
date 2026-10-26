class type grab_broken_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_grab_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  method get_implicit : unit -> bool
  method as_grab_broken_event : Raw.Grab_broken_event.t
end

(* High-level class for GrabBrokenEvent *)
class grab_broken_event (obj : Raw.Grab_broken_event.t) : grab_broken_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)

    method get_grab_surface :
        unit -> App_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new App_launch_context_cycle_de440b34.surface
          (Raw.Grab_broken_event.get_grab_surface obj)

    method get_implicit : unit -> bool =
      fun () -> Raw.Grab_broken_event.get_implicit obj

    method as_grab_broken_event = obj
  end
