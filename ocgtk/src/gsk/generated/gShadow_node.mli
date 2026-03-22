class type shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method as_shadow_node : Shadow_node.t
end

class shadow_node : Shadow_node.t -> shadow_node_t

