class type radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method get_center : unit -> Ocgtk_graphene.Graphene.Point.point_t
    method get_end : unit -> float
    method get_hradius : unit -> float
    method get_start : unit -> float
    method get_vradius : unit -> float
    method as_radial_gradient_node : Radial_gradient_node.t
end

class radial_gradient_node : Radial_gradient_node.t -> radial_gradient_node_t

