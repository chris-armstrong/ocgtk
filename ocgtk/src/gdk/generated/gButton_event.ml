class type button_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_button : unit -> int
    method as_button_event : Button_event.t
end

(* High-level class for ButtonEvent *)
class button_event (obj : Button_event.t) : button_event_t = object (self)
  inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event (Obj.magic obj : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t)

  method get_button : unit -> int =
    fun () ->
      (Button_event.get_button obj)

    method as_button_event = obj
end

