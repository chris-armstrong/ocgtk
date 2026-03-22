class type fill_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_fill_rule : unit -> Gsk_enums.fillrule
    method get_path : unit -> Path_and__path_measure_and__path_point.Path.t
    method as_fill_node : Fill_node.t
end

(* High-level class for FillNode *)
class fill_node (obj : Fill_node.t) : fill_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
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

let new_ (child : GRender_node.render_node_t) (path : Path_and__path_measure_and__path_point.Path.t) (fill_rule : Gsk_enums.fillrule) : fill_node_t =
  let child = child#as_render_node in
  new fill_node (Fill_node.new_ child path fill_rule)

