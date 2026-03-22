class type container_node_t = object
    inherit GRender_node.render_node_t
    method get_child : int -> GRender_node.render_node_t
    method get_n_children : unit -> int
    method as_container_node : Container_node.t
end

class container_node : Container_node.t -> container_node_t

val new_ : Render_node.t array -> int -> container_node_t
