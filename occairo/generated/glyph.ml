class type glyph_t = object
  method as_glyph : Glyph.t
end

(* High-level class for Glyph *)
class glyph (obj : Glyph.t) : glyph_t =
  object (self)
    method as_glyph = obj
  end
