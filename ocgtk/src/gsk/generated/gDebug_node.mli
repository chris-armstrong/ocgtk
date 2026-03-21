class type debug_node_t = object
    method get_child : unit -> GRender_node.render_node_t
    method get_message : unit -> string
    method as_debug_node : Debug_node.t
end

class debug_node : Debug_node.t -> debug_node_t

