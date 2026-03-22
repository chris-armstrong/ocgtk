class type repeating_linear_gradient_node_t = object
    inherit GRender_node.render_node_t
    method as_repeating_linear_gradient_node : Repeating_linear_gradient_node.t
end

class repeating_linear_gradient_node : Repeating_linear_gradient_node.t -> repeating_linear_gradient_node_t

