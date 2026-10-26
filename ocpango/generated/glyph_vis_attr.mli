class type glyph_vis_attr_t = object
  method as_glyph_vis_attr : Raw.Glyph_vis_attr.t
end

class glyph_vis_attr : Raw.Glyph_vis_attr.t -> glyph_vis_attr_t
