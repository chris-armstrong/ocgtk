(* High-level class for ColorMatrixNode *)
class color_matrix_node (obj : Color_matrix_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Color_matrix_node.get_child obj)

    method as_color_matrix_node = obj
end

