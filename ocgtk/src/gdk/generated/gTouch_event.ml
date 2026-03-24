class type touch_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_emulating_pointer : unit -> bool
    method as_touch_event : Touch_event.t
end

(* High-level class for TouchEvent *)
class touch_event (obj : Touch_event.t) : touch_event_t = object (self)
  inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event (obj :> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t)

  method get_emulating_pointer : unit -> bool =
    fun () ->
      (Touch_event.get_emulating_pointer obj)

    method as_touch_event = obj
end

