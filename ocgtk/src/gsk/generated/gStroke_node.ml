(* High-level class for StrokeNode *)
class stroke_node (obj : Stroke_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Stroke_node.get_child obj)

  method get_path : unit -> Path_and__path_measure_and__path_point.Path.t =
    fun () ->
      (Stroke_node.get_path obj)

  method get_stroke : unit -> Stroke.t =
    fun () ->
      (Stroke_node.get_stroke obj)

    method as_stroke_node = obj
end

