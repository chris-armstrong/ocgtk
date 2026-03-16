class glyph_item : Glyph_item.t ->
  object
    method copy : unit -> Glyph_item.t option
    method free : unit -> unit
    method get_logical_widths : string -> int array -> unit
    method letter_space : string -> Log_attr.t array -> int -> unit
    method split : string -> int -> Glyph_item.t option
    method as_glyph_item : Glyph_item.t
  end

