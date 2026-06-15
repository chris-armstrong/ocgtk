class type glyph_vis_attr_t = object
  method get_is_cluster_start : int
  method set_is_cluster_start : int -> unit
  method get_is_color : int
  method set_is_color : int -> unit
  method as_glyph_vis_attr : Glyph_vis_attr.t
end

(* High-level class for GlyphVisAttr *)
class glyph_vis_attr (obj : Glyph_vis_attr.t) : glyph_vis_attr_t =
  object (self)
    method get_is_cluster_start : int = Glyph_vis_attr.get_is_cluster_start obj

    method set_is_cluster_start : int -> unit =
      fun v -> Glyph_vis_attr.set_is_cluster_start obj v

    method get_is_color : int = Glyph_vis_attr.get_is_color obj

    method set_is_color : int -> unit =
      fun v -> Glyph_vis_attr.set_is_color obj v

    method as_glyph_vis_attr = obj
  end

let make (is_cluster_start : int) (is_color : int) : glyph_vis_attr_t =
  new glyph_vis_attr (Glyph_vis_attr.make is_cluster_start is_color)
