class type glyph_info_t = object
  method as_glyph_info : Raw.Glyph_info.t
end

class glyph_info : Raw.Glyph_info.t -> glyph_info_t
