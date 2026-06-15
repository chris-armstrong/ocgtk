class type glyph_geometry_t = object
  method get_width : unit
  method set_width : unit -> unit
  method get_x_offset : unit
  method set_x_offset : unit -> unit
  method get_y_offset : unit
  method set_y_offset : unit -> unit
  method as_glyph_geometry : Glyph_geometry.t
end

(* High-level class for GlyphGeometry *)
class glyph_geometry (obj : Glyph_geometry.t) : glyph_geometry_t =
  object (self)
    method get_width : unit = Glyph_geometry.get_width obj
    method set_width : unit -> unit = fun v -> Glyph_geometry.set_width obj v
    method get_x_offset : unit = Glyph_geometry.get_x_offset obj

    method set_x_offset : unit -> unit =
      fun v -> Glyph_geometry.set_x_offset obj v

    method get_y_offset : unit = Glyph_geometry.get_y_offset obj

    method set_y_offset : unit -> unit =
      fun v -> Glyph_geometry.set_y_offset obj v

    method as_glyph_geometry = obj
  end

let make (width : unit) (x_offset : unit) (y_offset : unit) : glyph_geometry_t =
  new glyph_geometry (Glyph_geometry.make width x_offset y_offset)
