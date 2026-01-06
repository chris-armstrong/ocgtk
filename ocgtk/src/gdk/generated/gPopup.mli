class popup : Popup.t ->
  object
    method get_autohide : unit -> bool
    method get_parent : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface option
    method get_position_x : unit -> int
    method get_position_y : unit -> int
    method present : int -> int -> Popup_layout.t -> bool
    method as_popup : Popup.t
  end

