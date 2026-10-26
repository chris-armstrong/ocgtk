class type text_node_t = object
  inherit Render_node.render_node_t
  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  method get_font : unit -> Ocpango.Font.font_t
  method get_num_glyphs : unit -> int
  method get_offset : unit -> Ocgraphene.Point.point_t
  method has_color_glyphs : unit -> bool
  method as_text_node : Raw.Text_node.t
end

class text_node : Raw.Text_node.t -> text_node_t

val new_ :
  Ocpango.Font.font_t ->
  Ocpango.Glyph_string.glyph_string_t ->
  Ocgdk.Rgb_a.rgb_a_t ->
  Ocgraphene.Point.point_t ->
  text_node_t
