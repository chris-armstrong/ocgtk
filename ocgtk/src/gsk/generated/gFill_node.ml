(* High-level class for FillNode *)
class fill_node (obj : Fill_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Fill_node.get_child obj)

  method get_fill_rule : unit -> Gsk_enums.fillrule =
    fun () ->
      (Fill_node.get_fill_rule obj)

  method get_path : unit -> Path_and__path_measure_and__path_point.Path.t =
    fun () ->
      (Fill_node.get_path obj)

    method as_fill_node = obj
end

