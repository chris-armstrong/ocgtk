class type glyph_t = object
  method as_glyph : Raw.Glyph.t
end

class glyph : Raw.Glyph.t -> glyph_t
