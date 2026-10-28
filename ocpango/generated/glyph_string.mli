(** A [PangoGlyphString] is used to store strings of glyphs with geometry and
    visual attribute information.

    The storage for the glyph information is owned by the structure which
    simplifies memory management.

    Its methods, signals and properties are on {!class-type-glyph_string_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Glyph_string}. *)

(** {b The methods, signals and properties of a [GlyphString].}

    A [PangoGlyphString] is used to store strings of glyphs with geometry and
    visual attribute information.

    The storage for the glyph information is owned by the structure which
    simplifies memory management. *)
class type glyph_string_t = object
  method get_width : unit -> int
  (** Computes the logical width of the glyph string.

      This can also be computed using [Pango.GlyphString.extents]. However,
      since this only computes the width, it's much faster. This is in fact only
      a convenience function that computes the sum of \@geometry.width for each
      glyph in the [glyphs]. *)

  method set_size : int -> unit
  (** Resize a glyph string to the given length. *)

  method as_glyph_string : Raw.Glyph_string.t
end

class glyph_string : Raw.Glyph_string.t -> glyph_string_t
(** Wraps a raw handle of {!Ocpango.Raw.Glyph_string.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> glyph_string_t
(** Create a new [PangoGlyphString]. *)
