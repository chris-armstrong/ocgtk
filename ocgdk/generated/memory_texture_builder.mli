class type memory_texture_builder_t = object
  method build : unit -> GTexture.texture_t
  method get_bytes : unit -> Glib_bytes.t option
  method get_color_state : unit -> Cicp_params_and__color_state.Color_state.t
  method get_format : unit -> Gdk_enums.memoryformat
  method get_height : unit -> int
  method get_offset : int -> Gsize.t
  method get_stride : unit -> Gsize.t
  method get_stride_for_plane : int -> Gsize.t
  method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
  method get_update_texture : unit -> GTexture.texture_t option
  method get_width : unit -> int
  method set_bytes : Glib_bytes.t option -> unit
  method set_color_state : Cicp_params_and__color_state.Color_state.t -> unit
  method set_format : Gdk_enums.memoryformat -> unit
  method set_height : int -> unit
  method set_offset : int -> Gsize.t -> unit
  method set_stride : Gsize.t -> unit
  method set_stride_for_plane : int -> Gsize.t -> unit
  method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
  method set_update_texture : GTexture.texture_t option -> unit
  method set_width : int -> unit
  method as_memory_texture_builder : Memory_texture_builder.t
end

class memory_texture_builder :
  Memory_texture_builder.t ->
  memory_texture_builder_t

val new_ : unit -> memory_texture_builder_t
