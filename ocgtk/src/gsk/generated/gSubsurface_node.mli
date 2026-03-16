class subsurface_node : Subsurface_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method as_subsurface_node : Subsurface_node.t
  end

