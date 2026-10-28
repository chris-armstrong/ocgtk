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

(* High-level class for GlyphItem *)
class glyph_item (obj : Raw.Glyph_item.t) : glyph_item_t =
  object (self)
    method apply_attrs : string -> Raw.Attr_list.t -> Raw.Glyph_item.t list =
      fun text list -> Raw.Glyph_item.apply_attrs obj text list

    method split : string -> int -> Raw.Glyph_item.t option =
      fun text split_index -> Raw.Glyph_item.split obj text split_index

    method as_glyph_item = obj
  end
