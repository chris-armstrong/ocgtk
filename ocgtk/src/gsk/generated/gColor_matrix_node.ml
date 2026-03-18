(* High-level class for ColorMatrixNode *)
class color_matrix_node (obj : Color_matrix_node.t) = object (self)

  method get_child : unit -> GRender_node.render_node =
    fun () ->
      new  GRender_node.render_node(Color_matrix_node.get_child obj)

  method get_color_matrix : unit -> Ocgtk_graphene.Graphene.matrix =
    fun () ->
      new  Ocgtk_graphene.Graphene.matrix(Color_matrix_node.get_color_matrix obj)

  method get_color_offset : unit -> Ocgtk_graphene.Graphene.vec4 =
    fun () ->
      new  Ocgtk_graphene.Graphene.vec4(Color_matrix_node.get_color_offset obj)

    method as_color_matrix_node = obj
end

