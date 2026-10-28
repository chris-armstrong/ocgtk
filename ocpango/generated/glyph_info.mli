(** A [PangoGlyphInfo] structure represents a single glyph with positioning
    information and visual attributes.

    Its methods, signals and properties are on {!class-type-glyph_info_t}. The
    functions it is built on are in {!Ocpango.Raw.Glyph_info}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GlyphInfo].}

    A [PangoGlyphInfo] structure represents a single glyph with positioning
    information and visual attributes. *)
class type glyph_info_t = object
  method as_glyph_info : Raw.Glyph_info.t
end

class glyph_info : Raw.Glyph_info.t -> glyph_info_t
(** Wraps a raw handle of {!Ocpango.Raw.Glyph_info.t}. *)
