class type cross_fade_node_t = object
    method get_end_child : unit -> GRender_node.render_node_t
    method get_progress : unit -> float
    method get_start_child : unit -> GRender_node.render_node_t
    method as_cross_fade_node : Cross_fade_node.t
end

class cross_fade_node : Cross_fade_node.t -> cross_fade_node_t

