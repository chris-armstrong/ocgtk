class rounded_clip_node : Rounded_clip_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_clip : unit -> Rounded_rect.t
    method as_rounded_clip_node : Rounded_clip_node.t
  end

