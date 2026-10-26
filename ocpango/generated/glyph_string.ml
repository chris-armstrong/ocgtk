class type glyph_string_t = object
  method get_width : unit -> int
  method set_size : int -> unit
  method as_glyph_string : Raw.Glyph_string.t
end

(* High-level class for GlyphString *)
class glyph_string (obj : Raw.Glyph_string.t) : glyph_string_t =
  object (self)
    method get_width : unit -> int = fun () -> Raw.Glyph_string.get_width obj

    method set_size : int -> unit =
      fun new_len -> Raw.Glyph_string.set_size obj new_len

    method as_glyph_string = obj
  end

let new_ () : glyph_string_t = new glyph_string (Raw.Glyph_string.new_ ())
