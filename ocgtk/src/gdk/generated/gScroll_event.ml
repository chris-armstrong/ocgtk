class type scroll_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_direction : unit -> Gdk_enums.scrolldirection
    method get_unit : unit -> Gdk_enums.scrollunit
    method is_stop : unit -> bool
    method as_scroll_event : Scroll_event.t
end

(* High-level class for ScrollEvent *)
class scroll_event (obj : Scroll_event.t) : scroll_event_t = object (self)
  inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event (obj :> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t)

  method get_direction : unit -> Gdk_enums.scrolldirection =
    fun () ->
      (Scroll_event.get_direction obj)

  method get_unit : unit -> Gdk_enums.scrollunit =
    fun () ->
      (Scroll_event.get_unit obj)

  method is_stop : unit -> bool =
    fun () ->
      (Scroll_event.is_stop obj)

    method as_scroll_event = obj
end

