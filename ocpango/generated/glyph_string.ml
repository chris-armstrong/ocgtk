class type glyph_string_t = object
  (** {2:methods Methods} *)

  method get_width : unit -> int
  (** Computes the logical width of the glyph string.

      This can also be computed using [Pango.GlyphString.extents]. However,
      since this only computes the width, it's much faster. This is in fact only
      a convenience function that computes the sum of \@geometry.width for each
      glyph in the [glyphs]. *)

  method set_size : int -> unit
  (** Resize a glyph string to the given length. *)

  (** {2:conversions Conversions} *)

  method as_glyph_string : Raw.Glyph_string.t
end

(* High-level class for GlyphString *)
class glyph_string (obj : Raw.Glyph_string.t) : glyph_string_t =
  object (self)
    method get_width : unit -> int = fun () -> Raw.Glyph_string.get_width obj

    method set_size : int -> unit =
      fun new_len -> Raw.Glyph_string.set_size obj new_len

    method as_glyph_string = obj
  end

let new_ () : glyph_string_t = new glyph_string (Raw.Glyph_string.new_ ())
