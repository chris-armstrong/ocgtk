(* Signal class defined in gdrag_signals.ml *)

(* High-level class for Drag *)
class drag (obj : Drag.t) = object (self)
  inherit Gdrag_signals.drag_signals obj

  method drop_done : bool -> unit =
    fun success ->
      (Drag.drop_done obj success)

  method get_actions : unit -> Gdk_enums.dragaction =
    fun () ->
      (Drag.get_actions obj)

  method get_content : unit -> GContent_provider.content_provider =
    fun () ->
      new  GContent_provider.content_provider(Drag.get_content obj)

  method get_device : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device(Drag.get_device obj)

  method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display(Drag.get_display obj)

  method get_drag_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface option =
    fun () ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface ret) (Drag.get_drag_surface obj)

  method get_formats : unit -> Content_formats.t =
    fun () ->
      (Drag.get_formats obj)

  method get_selected_action : unit -> Gdk_enums.dragaction =
    fun () ->
      (Drag.get_selected_action obj)

  method get_surface : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface =
    fun () ->
      new  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface(Drag.get_surface obj)

  method set_hotspot : int -> int -> unit =
    fun hot_x hot_y ->
      (Drag.set_hotspot obj hot_x hot_y)

    method as_drag = obj
end

