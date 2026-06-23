class type glyph_info_t = object
  method get_glyph : unit
  method set_glyph : unit -> unit
  method get_geometry : Glyph_geometry.t
  method set_geometry : Glyph_geometry.t -> unit
  method get_attr : Glyph_vis_attr.t
  method set_attr : Glyph_vis_attr.t -> unit
  method as_glyph_info : Glyph_info.t
end

class glyph_info : Glyph_info.t -> glyph_info_t

val make : unit -> Glyph_geometry.t -> Glyph_vis_attr.t -> glyph_info_t
