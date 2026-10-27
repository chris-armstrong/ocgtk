(** A [PangoGlyphItem] is a pair of a [PangoItem] and the glyphs resulting from
    shaping the items text.

    As an example of the usage of [PangoGlyphItem], the results of shaping text
    with [PangoLayout] is a list of [PangoLayoutLine], each of which contains a
    list of [PangoGlyphItem].

    Its methods, signals and properties are on {!class-type-glyph_item_t}. The
    functions it is built on are in {!Ocpango.Raw.Glyph_item}. *)

(** The methods, signals and properties of a [PangoGlyphItem]. *)
class type glyph_item_t = object
  method apply_attrs : string -> Raw.Attr_list.t -> Raw.Glyph_item.t list
  method split : string -> int -> Raw.Glyph_item.t option
  method as_glyph_item : Raw.Glyph_item.t
end

class glyph_item : Raw.Glyph_item.t -> glyph_item_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Glyph_item.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoGlyphItem], give one already wrapped. *)
