class glyph_string : Glyph_string.t ->
  object
    method copy : unit -> Glyph_string.t option
    method free : unit -> unit
    method get_logical_widths : string -> int -> int -> int array -> unit
    method get_width : unit -> int
    method set_size : int -> unit
    method as_glyph_string : Glyph_string.t
  end

