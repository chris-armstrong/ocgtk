class type dnd_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_drop : unit -> GDrop.drop_t option
    method as_dnd_event : Dnd_event.t
end

class dnd_event : Dnd_event.t -> dnd_event_t

