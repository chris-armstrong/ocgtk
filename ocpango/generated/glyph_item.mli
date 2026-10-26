class type glyph_item_t = object
  method apply_attrs : string -> Attr_list.t -> Glyph_item.t list
  method split : string -> int -> Glyph_item.t option
  method as_glyph_item : Glyph_item.t
end

class glyph_item : Glyph_item.t -> glyph_item_t
