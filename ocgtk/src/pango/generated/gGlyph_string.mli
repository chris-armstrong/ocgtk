class type glyph_string_t = object
  method get_width : unit -> int
  method set_size : int -> unit
  method as_glyph_string : Glyph_string.t
end

class glyph_string : Glyph_string.t -> glyph_string_t

val new_ : unit -> glyph_string_t
