class type glyph_item_iter_t = object
  method init_end : Glyph_item.t -> string -> bool
  method init_start : Glyph_item.t -> string -> bool
  method next_cluster : unit -> bool
  method prev_cluster : unit -> bool
  method as_glyph_item_iter : Glyph_item_iter.t
end

class glyph_item_iter : Glyph_item_iter.t -> glyph_item_iter_t
