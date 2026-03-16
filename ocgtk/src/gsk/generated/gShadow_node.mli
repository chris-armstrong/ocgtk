class shadow_node : Shadow_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method as_shadow_node : Shadow_node.t
  end

