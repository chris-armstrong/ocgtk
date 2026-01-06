class drop : Drop.t ->
  object
    method finish : Gdk_enums.dragaction -> unit
    method get_actions : unit -> Gdk_enums.dragaction
    method get_device : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device
    method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display
    method get_drag : unit -> GDrag.drag option
    method get_formats : unit -> Content_formats.t
    method get_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface
    method status : Gdk_enums.dragaction -> Gdk_enums.dragaction -> unit
    method as_drop : Drop.t
  end

