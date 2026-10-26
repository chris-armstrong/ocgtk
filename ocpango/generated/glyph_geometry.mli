class type glyph_geometry_t = object
  method as_glyph_geometry : Raw.Glyph_geometry.t
end

class glyph_geometry : Raw.Glyph_geometry.t -> glyph_geometry_t
