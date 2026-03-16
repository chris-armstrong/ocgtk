class clip_node : Clip_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method as_clip_node : Clip_node.t
  end

