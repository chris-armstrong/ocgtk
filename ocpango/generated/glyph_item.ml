class type glyph_item_t = object
  method apply_attrs : string -> Attr_list.t -> Glyph_item.t list
  method split : string -> int -> Glyph_item.t option
  method as_glyph_item : Glyph_item.t
end

(* High-level class for GlyphItem *)
class glyph_item (obj : Glyph_item.t) : glyph_item_t =
  object (self)
    method apply_attrs : string -> Attr_list.t -> Glyph_item.t list =
      fun text list -> Glyph_item.apply_attrs obj text list

    method split : string -> int -> Glyph_item.t option =
      fun text split_index -> Glyph_item.split obj text split_index

    method as_glyph_item = obj
  end
