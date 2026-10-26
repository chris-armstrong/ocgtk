class type glyph_vis_attr_t = object
  method as_glyph_vis_attr : Glyph_vis_attr.t
end

(* High-level class for GlyphVisAttr *)
class glyph_vis_attr (obj : Glyph_vis_attr.t) : glyph_vis_attr_t =
  object (self)
    method as_glyph_vis_attr = obj
  end
