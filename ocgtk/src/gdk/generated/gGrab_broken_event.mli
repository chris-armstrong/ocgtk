class grab_broken_event : Grab_broken_event.t ->
  object
    method get_grab_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface
    method get_implicit : unit -> bool
    method as_grab_broken_event : Grab_broken_event.t
  end

