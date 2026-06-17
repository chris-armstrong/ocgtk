class type gl_texture_builder_t = object
  method get_context :
    unit -> GApp_launch_context_cycle_de440b34.gl_context_t option

  method get_format : unit -> Gdk_enums.memoryformat
  method get_has_mipmap : unit -> bool
  method get_height : unit -> int
  method get_id : unit -> int
  method get_update_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
  method get_update_texture : unit -> GTexture.texture_t option
  method get_width : unit -> int

  method set_context :
    GApp_launch_context_cycle_de440b34.gl_context_t option -> unit

  method set_format : Gdk_enums.memoryformat -> unit
  method set_has_mipmap : bool -> unit
  method set_height : int -> unit
  method set_id : int -> unit
  method set_update_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
  method set_update_texture : GTexture.texture_t option -> unit
  method set_width : int -> unit
  method as_gl_texture_builder : Gl_texture_builder.t
end

class gl_texture_builder : Gl_texture_builder.t -> gl_texture_builder_t

val new_ : unit -> gl_texture_builder_t
