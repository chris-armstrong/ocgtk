class type glyph_t = object
  method as_glyph : Glyph.t
end

class glyph : Glyph.t -> glyph_t
