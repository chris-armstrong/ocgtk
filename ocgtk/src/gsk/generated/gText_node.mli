class type text_node_t = object
  inherit GRender_node.render_node_t
  method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
  method get_font : unit -> Ocgtk_pango.Pango.Font.font_t
  method get_num_glyphs : unit -> int
  method get_offset : unit -> Ocgtk_graphene.Graphene.Point.point_t
  method has_color_glyphs : unit -> bool
  method as_text_node : Text_node.t
end

class text_node : Text_node.t -> text_node_t

val new_ :
  Ocgtk_pango.Pango.Font.font_t ->
  Ocgtk_pango.Pango.Glyph_string.glyph_string_t ->
  Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t ->
  Ocgtk_graphene.Graphene.Point.point_t ->
  text_node_t
