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
  (** Splits a shaped item ([PangoGlyphItem]) into multiple items based on an
      attribute list.

      The idea is that if you have attributes that don't affect shaping, such as
      color or underline, to avoid affecting shaping, you filter them out
      ([Pango.AttrList.filter]), apply the shaping process and then reapply them
      to the result using this function.

      All attributes that start or end inside a cluster are applied to that
      cluster; for instance, if half of a cluster is underlined and the
      other-half strikethrough, then the cluster will end up with both underline
      and strikethrough attributes. In these cases, it may happen that
      [item]->extra_attrs for some of the result items can have multiple
      attributes of the same type.

      This function takes ownership of [glyph_item]; it will be reused as one of
      the elements in the list. *)

  method split : string -> int -> Raw.Glyph_item.t option
  (** Modifies [orig] to cover only the text after [split_index], and returns a
      new item that covers the text before [split_index] that used to be in
      [orig].

      You can think of [split_index] as the length of the returned item.
      [split_index] may not be 0, and it may not be greater than or equal to the
      length of [orig] (that is, there must be at least one byte assigned to
      each item, you can't create a zero-length item).

      This function is similar in function to pango_item_split() (and uses it
      internally.) *)

  method as_glyph_item : Raw.Glyph_item.t
end

class glyph_item : Raw.Glyph_item.t -> glyph_item_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Glyph_item.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoGlyphItem], give one already wrapped. *)
