class type glyph_vis_attr_t = object
  method get_is_cluster_start : int
  method set_is_cluster_start : int -> unit
  method get_is_color : int
  method set_is_color : int -> unit
  method as_glyph_vis_attr : Glyph_vis_attr.t
end

class glyph_vis_attr : Glyph_vis_attr.t -> glyph_vis_attr_t

val make : int -> int -> glyph_vis_attr_t
