(** A [PangoGlyphInfo] structure represents a single glyph with positioning
    information and visual attributes.

    Its methods, signals and properties are on {!class-type-glyph_info_t}. The
    functions it is built on are in {!Ocpango.Raw.Glyph_info}. *)

(** The methods, signals and properties of a [PangoGlyphInfo]. *)
class type glyph_info_t = object
  method as_glyph_info : Raw.Glyph_info.t
end

class glyph_info : Raw.Glyph_info.t -> glyph_info_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Glyph_info.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoGlyphInfo], give one already wrapped. *)
