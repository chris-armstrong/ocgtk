(** A [PangoGlyphString] is used to store strings of glyphs with geometry and
    visual attribute information.

    The storage for the glyph information is owned by the structure which
    simplifies memory management.

    Its methods, signals and properties are on {!class-type-glyph_string_t}. The
    functions it is built on are in {!Ocpango.Raw.Glyph_string}. *)

(** The methods, signals and properties of a [PangoGlyphString]. *)
class type glyph_string_t = object
  method get_width : unit -> int
  method set_size : int -> unit
  method as_glyph_string : Raw.Glyph_string.t
end

class glyph_string : Raw.Glyph_string.t -> glyph_string_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Glyph_string.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [PangoGlyphString], give one already wrapped. *)

val new_ : unit -> glyph_string_t
