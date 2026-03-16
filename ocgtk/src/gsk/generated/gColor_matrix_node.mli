class color_matrix_node : Color_matrix_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method as_color_matrix_node : Color_matrix_node.t
  end

