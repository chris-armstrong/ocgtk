class type color_node_t = object
  inherit Render_node.render_node_t
  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  method as_color_node : Raw.Color_node.t
end

class color_node : Raw.Color_node.t -> color_node_t

val new_ : Ocgdk.Rgb_a.rgb_a_t -> Ocgraphene.Rect.rect_t -> color_node_t
