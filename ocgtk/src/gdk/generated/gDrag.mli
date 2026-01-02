class drag : Drag.t ->
  object
    inherit Gdrag_signals.drag_signals
    method drop_done : bool -> unit
    method get_actions : unit -> Gdk_enums.dragaction
    method get_content : unit -> GContent_provider.content_provider
    method get_device : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device
    method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display
    method get_drag_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface option
    method get_formats : unit -> Content_formats.t
    method get_selected_action : unit -> Gdk_enums.dragaction
    method get_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface
    method set_hotspot : int -> int -> unit
    method as_drag : Drag.t
  end

