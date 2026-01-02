class toplevel_layout : Toplevel_layout.t ->
  object
    method copy : unit -> Toplevel_layout.t
    method equal : Toplevel_layout.t -> bool
    method get_fullscreen_monitor : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor option
    method get_resizable : unit -> bool
    method ref : unit -> Toplevel_layout.t
    method set_fullscreen : bool -> #GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor option -> unit
    method set_maximized : bool -> unit
    method set_resizable : bool -> unit
    method unref : unit -> unit
    method as_toplevel_layout : Toplevel_layout.t
  end

