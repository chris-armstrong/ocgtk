class type glyph_info_t = object
  method get_glyph : unit
  method set_glyph : unit -> unit
  method get_geometry : Glyph_geometry.t
  method set_geometry : Glyph_geometry.t -> unit
  method get_attr : Glyph_vis_attr.t
  method set_attr : Glyph_vis_attr.t -> unit
  method as_glyph_info : Glyph_info.t
end

(* High-level class for GlyphInfo *)
class glyph_info (obj : Glyph_info.t) : glyph_info_t =
  object (self)
    method get_glyph : unit = Glyph_info.get_glyph obj
    method set_glyph : unit -> unit = fun v -> Glyph_info.set_glyph obj v
    method get_geometry : Glyph_geometry.t = Glyph_info.get_geometry obj

    method set_geometry : Glyph_geometry.t -> unit =
      fun v -> Glyph_info.set_geometry obj v

    method get_attr : Glyph_vis_attr.t = Glyph_info.get_attr obj

    method set_attr : Glyph_vis_attr.t -> unit =
      fun v -> Glyph_info.set_attr obj v

    method as_glyph_info = obj
  end

let make (glyph : unit) (geometry : Glyph_geometry.t) (attr : Glyph_vis_attr.t)
    : glyph_info_t =
  new glyph_info (Glyph_info.make glyph geometry attr)
