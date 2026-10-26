class type glyph_item_t = object
  method apply_attrs : string -> Raw.Attr_list.t -> Raw.Glyph_item.t list
  method split : string -> int -> Raw.Glyph_item.t option
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
