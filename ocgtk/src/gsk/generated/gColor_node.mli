class type color_node_t = object
    inherit GRender_node.render_node_t
    method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method as_color_node : Color_node.t
end

class color_node : Color_node.t -> color_node_t

val new_ : Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> color_node_t
