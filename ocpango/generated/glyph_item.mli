class type glyph_item_t = object
  method apply_attrs : string -> Raw.Attr_list.t -> Raw.Glyph_item.t list
  method split : string -> int -> Raw.Glyph_item.t option
  method as_glyph_item : Raw.Glyph_item.t
end

class glyph_item : Raw.Glyph_item.t -> glyph_item_t
