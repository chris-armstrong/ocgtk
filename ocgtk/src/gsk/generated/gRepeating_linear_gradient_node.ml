class type repeating_linear_gradient_node_t = object
    inherit GRender_node.render_node_t
    method as_repeating_linear_gradient_node : Repeating_linear_gradient_node.t
end

(* High-level class for RepeatingLinearGradientNode *)
class repeating_linear_gradient_node (obj : Repeating_linear_gradient_node.t) : repeating_linear_gradient_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

    method as_repeating_linear_gradient_node = obj
end

