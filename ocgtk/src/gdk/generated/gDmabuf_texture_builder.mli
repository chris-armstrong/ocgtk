class dmabuf_texture_builder : Dmabuf_texture_builder.t ->
  object
    method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display
    method get_fd : int -> int
    method get_height : unit -> int
    method get_n_planes : unit -> int
    method get_offset : int -> int
    method get_premultiplied : unit -> bool
    method get_stride : int -> int
    method get_update_texture : unit -> GTexture.texture option
    method get_width : unit -> int
    method set_display : #GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display -> unit
    method set_fd : int -> int -> unit
    method set_height : int -> unit
    method set_n_planes : int -> unit
    method set_offset : int -> int -> unit
    method set_premultiplied : bool -> unit
    method set_stride : int -> int -> unit
    method set_update_texture : #GTexture.texture option -> unit
    method set_width : int -> unit
    method as_dmabuf_texture_builder : Dmabuf_texture_builder.t
  end

