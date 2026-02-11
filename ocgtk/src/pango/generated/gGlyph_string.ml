(* High-level class for GlyphString *)
class glyph_string (obj : Glyph_string.t) = object (self)

  method copy : unit -> Glyph_string.t option =
    fun () ->
      (Glyph_string.copy obj)

  method free : unit -> unit =
    fun () ->
      (Glyph_string.free obj)

  method get_logical_widths : string -> int -> int -> int array -> unit =
    fun text length embedding_level logical_widths ->
      (Glyph_string.get_logical_widths obj text length embedding_level logical_widths)

  method get_width : unit -> int =
    fun () ->
      (Glyph_string.get_width obj)

  method set_size : int -> unit =
    fun new_len ->
      (Glyph_string.set_size obj new_len)

    method as_glyph_string = obj
end

