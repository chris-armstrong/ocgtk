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

(* High-level class for GlyphItem *)
class glyph_item (obj : Glyph_item.t) : glyph_item_t =
  object (self)
    method apply_attrs : string -> Attr_list.t -> Glyph_item.t list =
      fun text list -> Glyph_item.apply_attrs obj text list

    method split : string -> int -> Glyph_item.t option =
      fun text split_index -> Glyph_item.split obj text split_index

    method get_item : Item.t = Glyph_item.get_item obj
    method set_item : Item.t -> unit = fun v -> Glyph_item.set_item obj v
    method get_glyphs : Glyph_string.t = Glyph_item.get_glyphs obj

    method set_glyphs : Glyph_string.t -> unit =
      fun v -> Glyph_item.set_glyphs obj v

    method get_y_offset : int = Glyph_item.get_y_offset obj
    method set_y_offset : int -> unit = fun v -> Glyph_item.set_y_offset obj v
    method get_start_x_offset : int = Glyph_item.get_start_x_offset obj

    method set_start_x_offset : int -> unit =
      fun v -> Glyph_item.set_start_x_offset obj v

    method get_end_x_offset : int = Glyph_item.get_end_x_offset obj

    method set_end_x_offset : int -> unit =
      fun v -> Glyph_item.set_end_x_offset obj v

    method as_glyph_item = obj
  end

let make (item : Item.t) (glyphs : Glyph_string.t) (y_offset : int)
    (start_x_offset : int) (end_x_offset : int) : glyph_item_t =
  new glyph_item
    (Glyph_item.make item glyphs y_offset start_x_offset end_x_offset)
