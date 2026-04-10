class type dmabuf_texture_builder_t = object
    method get_display : unit -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t
    method get_fd : int -> int
    method get_fourcc : unit -> int
    method get_height : unit -> int
    method get_modifier : unit -> Unsigned.UInt64.t
    method get_n_planes : unit -> int
    method get_offset : int -> int
    method get_premultiplied : unit -> bool
    method get_stride : int -> int
    method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
    method get_update_texture : unit -> GTexture.texture_t option
    method get_width : unit -> int
    method set_display : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t -> unit
    method set_fd : int -> int -> unit
    method set_fourcc : int -> unit
    method set_height : int -> unit
    method set_modifier : Unsigned.UInt64.t -> unit
    method set_n_planes : int -> unit
    method set_offset : int -> int -> unit
    method set_premultiplied : bool -> unit
    method set_stride : int -> int -> unit
    method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
    method set_update_texture : GTexture.texture_t option -> unit
    method set_width : int -> unit
    method as_dmabuf_texture_builder : Dmabuf_texture_builder.t
end

class dmabuf_texture_builder : Dmabuf_texture_builder.t -> dmabuf_texture_builder_t

val new_ : unit -> dmabuf_texture_builder_t
