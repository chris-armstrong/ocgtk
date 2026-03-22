class type repeating_radial_gradient_node_t = object
    inherit GRender_node.render_node_t
    method as_repeating_radial_gradient_node : Repeating_radial_gradient_node.t
end

(* High-level class for RepeatingRadialGradientNode *)
class repeating_radial_gradient_node (obj : Repeating_radial_gradient_node.t) : repeating_radial_gradient_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

    method as_repeating_radial_gradient_node = obj
end

