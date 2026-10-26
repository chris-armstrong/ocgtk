class type memory_texture_builder_t = object
  method build : unit -> Texture.texture_t
  method get_bytes : unit -> Glib_bytes.t option
  method get_color_state : unit -> Raw.Color_state.t
  method get_format : unit -> Enums.memoryformat
  method get_height : unit -> int
  method get_offset : int -> Gsize.t
  method get_stride : unit -> Gsize.t
  method get_stride_for_plane : int -> Gsize.t
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_bytes : Glib_bytes.t option -> unit
  method set_color_state : Raw.Color_state.t -> unit
  method set_format : Enums.memoryformat -> unit
  method set_height : int -> unit
  method set_offset : int -> Gsize.t -> unit
  method set_stride : Gsize.t -> unit
  method set_stride_for_plane : int -> Gsize.t -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_memory_texture_builder : Raw.Memory_texture_builder.t
end

class memory_texture_builder :
  Raw.Memory_texture_builder.t ->
  memory_texture_builder_t

val new_ : unit -> memory_texture_builder_t
