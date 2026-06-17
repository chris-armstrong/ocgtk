class type grab_broken_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_grab_surface : unit -> GApp_launch_context_cycle_de440b34.surface_t
  method get_implicit : unit -> bool
  method as_grab_broken_event : Grab_broken_event.t
end

(* High-level class for GrabBrokenEvent *)
class grab_broken_event (obj : Grab_broken_event.t) : grab_broken_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method get_grab_surface :
        unit -> GApp_launch_context_cycle_de440b34.surface_t =
      fun () ->
        new GApp_launch_context_cycle_de440b34.surface
          (Grab_broken_event.get_grab_surface obj)

    method get_implicit : unit -> bool =
      fun () -> Grab_broken_event.get_implicit obj

    method as_grab_broken_event = obj
  end
