class type repeating_radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method as_repeating_radial_gradient_node : Repeating_radial_gradient_node.t
end

class repeating_radial_gradient_node : Repeating_radial_gradient_node.t -> repeating_radial_gradient_node_t

