class debug_node : Debug_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_message : unit -> string
    method as_debug_node : Debug_node.t
  end

