class cross_fade_node : Cross_fade_node.t ->
  object
    method get_end_child : unit -> GRender_node.render_node
    method get_progress : unit -> float
    method get_start_child : unit -> GRender_node.render_node
    method as_cross_fade_node : Cross_fade_node.t
  end

