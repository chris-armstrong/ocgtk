class linear_gradient_node : Linear_gradient_node.t ->
  object
    method get_end : unit -> Ocgtk_graphene.Graphene.point
    method get_start : unit -> Ocgtk_graphene.Graphene.point
    method as_linear_gradient_node : Linear_gradient_node.t
  end

