class type crossing_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_detail : unit -> Gdk_enums.notifytype
    method get_focus : unit -> bool
    method get_mode : unit -> Gdk_enums.crossingmode
    method as_crossing_event : Crossing_event.t
end

class crossing_event : Crossing_event.t -> crossing_event_t

