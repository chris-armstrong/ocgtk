class fill_node : Fill_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_fill_rule : unit -> Gsk_enums.fillrule
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method as_fill_node : Fill_node.t
  end

