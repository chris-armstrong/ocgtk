class type glyph_geometry_t = object
  method get_width : unit
  method set_width : unit -> unit
  method get_x_offset : unit
  method set_x_offset : unit -> unit
  method get_y_offset : unit
  method set_y_offset : unit -> unit
  method as_glyph_geometry : Glyph_geometry.t
end

class glyph_geometry : Glyph_geometry.t -> glyph_geometry_t

val make : unit -> unit -> unit -> glyph_geometry_t
