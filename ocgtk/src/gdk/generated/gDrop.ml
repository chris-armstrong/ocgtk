(* High-level class for Drop *)
class drop (obj : Drop.t) = object (self)

  method finish : Gdk_enums.dragaction -> unit =
    fun action ->
      (Drop.finish obj action)

  method get_actions : unit -> Gdk_enums.dragaction =
    fun () ->
      (Drop.get_actions obj)

  method get_device : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device(Drop.get_device obj)

  method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display(Drop.get_display obj)

  method get_drag : unit -> GDrag.drag option =
    fun () ->
      Option.map (fun ret -> new GDrag.drag ret) (Drop.get_drag obj)

  method get_formats : unit -> Content_formats.t =
    fun () ->
      (Drop.get_formats obj)

  method get_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface(Drop.get_surface obj)

  method status : Gdk_enums.dragaction -> Gdk_enums.dragaction -> unit =
    fun actions preferred ->
      (Drop.status obj actions preferred)

    method as_drop = obj
end

