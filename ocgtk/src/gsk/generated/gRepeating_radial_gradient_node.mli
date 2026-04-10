class type repeating_radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method as_repeating_radial_gradient_node : Repeating_radial_gradient_node.t
end

class repeating_radial_gradient_node : Repeating_radial_gradient_node.t -> repeating_radial_gradient_node_t

val new_ : Ocgtk_graphene.Graphene.Rect.rect_t -> Ocgtk_graphene.Graphene.Point.point_t -> float -> float -> float -> float -> Color_stop.t array -> int -> repeating_radial_gradient_node_t
