class type glyph_item_iter_t = object
  method init_end : Glyph_item.t -> string -> bool
  method init_start : Glyph_item.t -> string -> bool
  method next_cluster : unit -> bool
  method prev_cluster : unit -> bool
  method get_glyph_item : Glyph_item.t
  method set_glyph_item : Glyph_item.t -> unit
  method get_text : string
  method set_text : string -> unit
  method get_start_glyph : int
  method set_start_glyph : int -> unit
  method get_start_index : int
  method set_start_index : int -> unit
  method get_start_char : int
  method set_start_char : int -> unit
  method get_end_glyph : int
  method set_end_glyph : int -> unit
  method get_end_index : int
  method set_end_index : int -> unit
  method get_end_char : int
  method set_end_char : int -> unit
  method as_glyph_item_iter : Glyph_item_iter.t
end

class glyph_item_iter : Glyph_item_iter.t -> glyph_item_iter_t

val make :
  Glyph_item.t ->
  string ->
  int ->
  int ->
  int ->
  int ->
  int ->
  int ->
  glyph_item_iter_t
