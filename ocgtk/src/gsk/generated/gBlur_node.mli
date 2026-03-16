class blur_node : Blur_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_radius : unit -> float
    method as_blur_node : Blur_node.t
  end

