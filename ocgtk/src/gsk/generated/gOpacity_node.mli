class type opacity_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_opacity : unit -> float
    method as_opacity_node : Opacity_node.t
end

class opacity_node : Opacity_node.t -> opacity_node_t

