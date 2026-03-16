class opacity_node : Opacity_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_opacity : unit -> float
    method as_opacity_node : Opacity_node.t
  end

