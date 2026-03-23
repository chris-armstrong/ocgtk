class type linear_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_end : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method get_start : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method as_linear_gradient_node : Linear_gradient_node.t
end

class linear_gradient_node : Linear_gradient_node.t -> linear_gradient_node_t

