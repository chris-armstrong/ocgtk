class transform_node : Transform_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_transform : unit -> Transform.t
    method as_transform_node : Transform_node.t
  end

