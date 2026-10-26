class type dmabuf_texture_builder_t = object
  method get_color_state : unit -> Raw.Color_state.t option
  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  method get_fd : int -> int
  method get_fourcc : unit -> UInt32.t
  method get_height : unit -> int
  method get_modifier : unit -> UInt64.t
  method get_n_planes : unit -> int
  method get_offset : int -> int
  method get_premultiplied : unit -> bool
  method get_stride : int -> int
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_color_state : Raw.Color_state.t option -> unit
  method set_display : App_launch_context_cycle_de440b34.display_t -> unit
  method set_fd : int -> int -> unit
  method set_fourcc : UInt32.t -> unit
  method set_height : int -> unit
  method set_modifier : UInt64.t -> unit
  method set_n_planes : int -> unit
  method set_offset : int -> int -> unit
  method set_premultiplied : bool -> unit
  method set_stride : int -> int -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_dmabuf_texture_builder : Raw.Dmabuf_texture_builder.t
end

class dmabuf_texture_builder :
  Raw.Dmabuf_texture_builder.t ->
  dmabuf_texture_builder_t

val new_ : unit -> dmabuf_texture_builder_t
