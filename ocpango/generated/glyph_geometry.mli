(** The [PangoGlyphGeometry] structure contains width and positioning
    information for a single glyph.

    Its methods, signals and properties are on {!class-type-glyph_geometry_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocpango.Raw.Glyph_geometry}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [GlyphGeometry].}

    The [PangoGlyphGeometry] structure contains width and positioning
    information for a single glyph.

    Note that [width] is not guaranteed to be the same as the glyph extents.
    Kerning and other positioning applied during shaping will affect both the
    [width] and the [x_offset] for the glyphs in the glyph string that results
    from shaping.

    The information in this struct is intended for rendering the glyphs, as
    follows:

    + Assume the current point is (x, y)
    + Render the current glyph at (x + x_offset, y + y_offset),
    + Advance the current point to (x + width, y)
    + Render the next glyph *)
class type glyph_geometry_t = object
  (** {2:conversions Conversions} *)

  method as_glyph_geometry : Raw.Glyph_geometry.t
end

class glyph_geometry : Raw.Glyph_geometry.t -> glyph_geometry_t
(** Wraps a raw handle of {!Ocpango.Raw.Glyph_geometry.t}. *)

(** {1:description Description}

    The [PangoGlyphGeometry] structure contains width and positioning
    information for a single glyph.

    Note that [width] is not guaranteed to be the same as the glyph extents.
    Kerning and other positioning applied during shaping will affect both the
    [width] and the [x_offset] for the glyphs in the glyph string that results
    from shaping.

    The information in this struct is intended for rendering the glyphs, as
    follows:

    + Assume the current point is (x, y)
    + Render the current glyph at (x + x_offset, y + y_offset),
    + Advance the current point to (x + width, y)
    + Render the next glyph *)
