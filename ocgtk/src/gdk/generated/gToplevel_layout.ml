class type toplevel_layout_t = object
    method copy : unit -> Toplevel_layout.t
    method equal : Toplevel_layout.t -> bool
    method get_fullscreen_monitor : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor_t option
    method get_resizable : unit -> bool
    method ref : unit -> Toplevel_layout.t
    method set_fullscreen : bool -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor_t option -> unit
    method set_maximized : bool -> unit
    method set_resizable : bool -> unit
    method unref : unit -> unit
    method as_toplevel_layout : Toplevel_layout.t
end

(* High-level class for ToplevelLayout *)
class toplevel_layout (obj : Toplevel_layout.t) : toplevel_layout_t = object (self)

  method copy : unit -> Toplevel_layout.t =
    fun () ->
      (Toplevel_layout.copy obj)

  method equal : Toplevel_layout.t -> bool =
    fun other ->
      (Toplevel_layout.equal obj other)

  method get_fullscreen_monitor : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor_t option =
    fun () ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor ret) (Toplevel_layout.get_fullscreen_monitor obj)

  method get_resizable : unit -> bool =
    fun () ->
      (Toplevel_layout.get_resizable obj)

  method ref : unit -> Toplevel_layout.t =
    fun () ->
      (Toplevel_layout.ref obj)

  method set_fullscreen : bool -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor_t option -> unit =
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

let new_ () : toplevel_layout_t =
  new toplevel_layout (Toplevel_layout.new_ ())

