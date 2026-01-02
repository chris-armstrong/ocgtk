(* High-level class for GrabBrokenEvent *)
class grab_broken_event (obj : Grab_broken_event.t) = object (self)

  method get_grab_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface(Grab_broken_event.get_grab_surface obj)

  method get_implicit : unit -> bool =
    fun () ->
      (Grab_broken_event.get_implicit obj)

    method as_grab_broken_event = obj
end

