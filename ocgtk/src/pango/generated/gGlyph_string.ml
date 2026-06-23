class type glyph_string_t = object
  method get_width : unit -> int
  method set_size : int -> unit
  method get_num_glyphs : int
  method set_num_glyphs : int -> unit
  method get_log_clusters : int
  method set_log_clusters : int -> unit
  method as_glyph_string : Glyph_string.t
end

(* High-level class for GlyphString *)
class glyph_string (obj : Glyph_string.t) : glyph_string_t =
  object (self)
    method get_width : unit -> int = fun () -> Glyph_string.get_width obj

    method set_size : int -> unit =
      fun new_len -> Glyph_string.set_size obj new_len

    method get_num_glyphs : int = Glyph_string.get_num_glyphs obj

    method set_num_glyphs : int -> unit =
      fun v -> Glyph_string.set_num_glyphs obj v

    method get_log_clusters : int = Glyph_string.get_log_clusters obj

    method set_log_clusters : int -> unit =
      fun v -> Glyph_string.set_log_clusters obj v

    method as_glyph_string = obj
  end

let new_ () : glyph_string_t = new glyph_string (Glyph_string.new_ ())

let make (num_glyphs : int) (log_clusters : int) : glyph_string_t =
  new glyph_string (Glyph_string.make num_glyphs log_clusters)
