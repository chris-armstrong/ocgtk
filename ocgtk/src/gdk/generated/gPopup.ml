(* High-level class for Popup *)
class popup (obj : Popup.t) = object (self)

  method get_autohide : unit -> bool =
    fun () ->
      (Popup.get_autohide obj)

  method get_parent : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface option =
    fun () ->
      Option.map (fun ret -> new GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface ret) (Popup.get_parent obj)

  method get_position_x : unit -> int =
    fun () ->
      (Popup.get_position_x obj)

  method get_position_y : unit -> int =
    fun () ->
      (Popup.get_position_y obj)

  method present : int -> int -> Popup_layout.t -> bool =
    fun width height layout ->
      (Popup.present obj width height layout)

    method as_popup = obj
end

