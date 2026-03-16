(* High-level class for GlyphItem *)
class glyph_item (obj : Glyph_item.t) = object (self)

  method copy : unit -> Glyph_item.t option =
    fun () ->
      (Glyph_item.copy obj)

  method free : unit -> unit =
    fun () ->
      (Glyph_item.free obj)

  method get_logical_widths : string -> int array -> unit =
    fun text logical_widths ->
      (Glyph_item.get_logical_widths obj text logical_widths)

  method letter_space : string -> Log_attr.t array -> int -> unit =
    fun text log_attrs letter_spacing ->
      (Glyph_item.letter_space obj text log_attrs letter_spacing)

  method split : string -> int -> Glyph_item.t option =
    fun text split_index ->
      (Glyph_item.split obj text split_index)

    method as_glyph_item = obj
end

