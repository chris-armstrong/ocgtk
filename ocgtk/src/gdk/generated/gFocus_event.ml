class type focus_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_in : unit -> bool
    method as_focus_event : Focus_event.t
end

(* High-level class for FocusEvent *)
class focus_event (obj : Focus_event.t) : focus_event_t = object (self)
  inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event (Obj.magic obj : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t)

  method get_in : unit -> bool =
    fun () ->
      (Focus_event.get_in obj)

    method as_focus_event = obj
end

