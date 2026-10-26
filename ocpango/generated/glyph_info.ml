class type glyph_info_t = object
  method as_glyph_info : Glyph_info.t
end

(* High-level class for GlyphInfo *)
class glyph_info (obj : Glyph_info.t) : glyph_info_t =
  object (self)
    method as_glyph_info = obj
  end
