class gl_texture_builder : Gl_texture_builder.t ->
  object
    method get_context : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.gl_context option
    method get_format : unit -> Gdk_enums.memoryformat
    method get_has_mipmap : unit -> bool
    method get_height : unit -> int
    method get_id : unit -> int
    method get_update_texture : unit -> GTexture.texture option
    method get_width : unit -> int
    method set_context : #GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.gl_context option -> unit
    method set_format : Gdk_enums.memoryformat -> unit
    method set_has_mipmap : bool -> unit
    method set_height : int -> unit
    method set_id : int -> unit
    method set_update_texture : #GTexture.texture option -> unit
    method set_width : int -> unit
    method as_gl_texture_builder : Gl_texture_builder.t
  end

