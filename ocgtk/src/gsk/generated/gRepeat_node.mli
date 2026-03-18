class repeat_node : Repeat_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_child_bounds : unit -> Ocgtk_graphene.Graphene.rect
    method as_repeat_node : Repeat_node.t
  end

