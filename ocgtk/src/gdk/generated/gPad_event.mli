class type pad_event_t = object
  inherit
    GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .event_t

  method get_button : unit -> int
  method as_pad_event : Pad_event.t
end

class pad_event : Pad_event.t -> pad_event_t
