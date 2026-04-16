class type delete_event_t = object
  inherit
    GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .event_t

  method as_delete_event : Delete_event.t
end

class delete_event : Delete_event.t -> delete_event_t
