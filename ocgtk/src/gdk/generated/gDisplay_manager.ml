(* Signal class defined in gdisplay_manager_signals.ml *)

(* High-level class for DisplayManager *)
class display_manager (obj : Display_manager.t) = object (self)
  inherit Gdisplay_manager_signals.display_manager_signals obj

  method get_default_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display option =
    fun () ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display ret) (Display_manager.get_default_display obj)

  method open_display : string option -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display option =
    fun name ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display ret) (Display_manager.open_display obj name)

  method set_default_display : 'p1. (#GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display as 'p1) -> unit =
    fun display ->
      let display = display#as_display in
      (Display_manager.set_default_display obj display)

    method as_display_manager = obj
end

