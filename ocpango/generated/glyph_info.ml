class type glyph_info_t = object
  (** {2:conversions Conversions} *)

  method as_glyph_info : Raw.Glyph_info.t
end

(* High-level class for GlyphInfo *)
class glyph_info (obj : Raw.Glyph_info.t) : glyph_info_t =
  object (self)
    method as_glyph_info = obj
  end
