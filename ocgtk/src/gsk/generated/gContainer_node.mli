class container_node : Container_node.t ->
  object
    method get_child : int -> GRender_node.render_node
    method get_n_children : unit -> int
    method as_container_node : Container_node.t
  end

