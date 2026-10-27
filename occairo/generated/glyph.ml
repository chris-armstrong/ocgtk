class type glyph_t = object
  method as_glyph : Raw.Glyph.t
end

(* High-level class for Glyph *)
class glyph (obj : Raw.Glyph.t) : glyph_t =
  object (self)
    method as_glyph = obj
  end
