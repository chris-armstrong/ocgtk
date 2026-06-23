class type glyph_string_t = object
  method get_width : unit -> int
  method set_size : int -> unit
  method get_num_glyphs : int
  method set_num_glyphs : int -> unit
  method get_log_clusters : int
  method set_log_clusters : int -> unit
  method as_glyph_string : Glyph_string.t
end

class glyph_string : Glyph_string.t -> glyph_string_t

val new_ : unit -> glyph_string_t
val make : int -> int -> glyph_string_t
