(* High-level class for GlyphItem *)
class glyph_item (obj : Glyph_item.t) = object (self)

  method copy : unit -> Glyph_item.t option =
    fun () ->
      (Glyph_item.copy obj)

  method free : unit -> unit =
    fun () ->
      (Glyph_item.free obj)

  method split : string -> int -> Glyph_item.t option =
    fun text split_index ->
      (Glyph_item.split obj text split_index)

    method as_glyph_item = obj
end

