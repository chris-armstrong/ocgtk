class stroke_node : Stroke_node.t ->
  object
    method get_child : unit -> GRender_node.render_node
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method get_stroke : unit -> Stroke.t
    method as_stroke_node : Stroke_node.t
  end

