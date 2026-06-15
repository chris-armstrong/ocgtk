class type glyph_item_t = object
  method apply_attrs : string -> Attr_list.t -> Glyph_item.t list
  method split : string -> int -> Glyph_item.t option
  method get_item : Item.t
  method set_item : Item.t -> unit
  method get_glyphs : Glyph_string.t
  method set_glyphs : Glyph_string.t -> unit
  method get_y_offset : int
  method set_y_offset : int -> unit
  method get_start_x_offset : int
  method set_start_x_offset : int -> unit
  method get_end_x_offset : int
  method set_end_x_offset : int -> unit
  method as_glyph_item : Glyph_item.t
end

class glyph_item : Glyph_item.t -> glyph_item_t

val make : Item.t -> Glyph_string.t -> int -> int -> int -> glyph_item_t
