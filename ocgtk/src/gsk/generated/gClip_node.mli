class clip_node : Clip_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_clip : unit -> Ocgtk_graphene.Graphene.rect
    method as_clip_node : Clip_node.t
  end

