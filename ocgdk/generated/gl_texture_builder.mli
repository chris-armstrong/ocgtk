class type gl_texture_builder_t = object
  method get_color_state : unit -> Raw.Color_state.t

  method get_context :
    unit -> App_launch_context_cycle_de440b34.gl_context_t option

  method get_format : unit -> Enums.memoryformat
  method get_has_mipmap : unit -> bool
  method get_height : unit -> int
  method get_id : unit -> int
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_color_state : Raw.Color_state.t -> unit

  method set_context :
    App_launch_context_cycle_de440b34.gl_context_t option -> unit

  method set_format : Enums.memoryformat -> unit
  method set_has_mipmap : bool -> unit
  method set_height : int -> unit
  method set_id : int -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_gl_texture_builder : Raw.Gl_texture_builder.t
end

class gl_texture_builder : Raw.Gl_texture_builder.t -> gl_texture_builder_t

val new_ : unit -> gl_texture_builder_t
