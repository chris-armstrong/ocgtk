class type conic_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_angle : unit -> float
    method get_center : unit -> Ocgtk_graphene.Graphene.point_t
    method get_rotation : unit -> float
    method as_conic_gradient_node : Conic_gradient_node.t
end

class conic_gradient_node : Conic_gradient_node.t -> conic_gradient_node_t

