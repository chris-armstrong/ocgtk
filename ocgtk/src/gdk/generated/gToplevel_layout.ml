(* High-level class for ToplevelLayout *)
class toplevel_layout (obj : Toplevel_layout.t) = object (self)

  method copy : unit -> Toplevel_layout.t =
    fun () ->
      (Toplevel_layout.copy obj)

  method equal : Toplevel_layout.t -> bool =
    fun other ->
      (Toplevel_layout.equal obj other)

  method get_fullscreen_monitor : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor option =
    fun () ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor ret) (Toplevel_layout.get_fullscreen_monitor obj)

  method get_resizable : unit -> bool =
    fun () ->
      (Toplevel_layout.get_resizable obj)

  method ref : unit -> Toplevel_layout.t =
    fun () ->
      (Toplevel_layout.ref obj)

  method set_fullscreen : 'p1. bool -> (#GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor as 'p1) option -> unit =
    fun fullscreen monitor ->
      let monitor = Option.map (fun (c) -> c#as_monitor) monitor in
      (Toplevel_layout.set_fullscreen obj fullscreen monitor)

  method set_maximized : bool -> unit =
    fun maximized ->
      (Toplevel_layout.set_maximized obj maximized)

  method set_resizable : bool -> unit =
    fun resizable ->
      (Toplevel_layout.set_resizable obj resizable)

  method unref : unit -> unit =
    fun () ->
      (Toplevel_layout.unref obj)

    method as_toplevel_layout = obj
end

