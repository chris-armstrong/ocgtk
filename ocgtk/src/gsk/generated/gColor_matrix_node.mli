class color_matrix_node : Color_matrix_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_color_matrix : unit -> Ocgtk_graphene.Graphene.matrix
    method get_color_offset : unit -> Ocgtk_graphene.Graphene.vec4
    method as_color_matrix_node : Color_matrix_node.t
  end

