class type glyph_geometry_t = object
    method as_glyph_geometry : Glyph_geometry.t
end

(* High-level class for GlyphGeometry *)
class glyph_geometry (obj : Glyph_geometry.t) : glyph_geometry_t = object (self)

    method as_glyph_geometry = obj
end

