class type repeating_radial_gradient_node_t = object
    method as_repeating_radial_gradient_node : Repeating_radial_gradient_node.t
end

(* High-level class for RepeatingRadialGradientNode *)
class repeating_radial_gradient_node (obj : Repeating_radial_gradient_node.t) : repeating_radial_gradient_node_t = object (self)

    method as_repeating_radial_gradient_node = obj
end

