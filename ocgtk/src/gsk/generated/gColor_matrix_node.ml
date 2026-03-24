class type color_matrix_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_color_matrix : unit -> Ocgtk_graphene.Graphene.Matrix.matrix_t
    method get_color_offset : unit -> Ocgtk_graphene.Graphene.Vec4.vec4_t
    method as_color_matrix_node : Color_matrix_node.t
end

(* High-level class for ColorMatrixNode *)
class color_matrix_node (obj : Color_matrix_node.t) : color_matrix_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_child : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Color_matrix_node.get_child obj)

  method get_color_matrix : unit -> Ocgtk_graphene.Graphene.Matrix.matrix_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Matrix.matrix(Color_matrix_node.get_color_matrix obj)

  method get_color_offset : unit -> Ocgtk_graphene.Graphene.Vec4.vec4_t =
    fun () ->
      new  Ocgtk_graphene.Graphene.Vec4.vec4(Color_matrix_node.get_color_offset obj)

    method as_color_matrix_node = obj
end

let new_ (child : GRender_node.render_node_t) (color_matrix : Ocgtk_graphene.Graphene.Matrix.matrix_t) (color_offset : Ocgtk_graphene.Graphene.Vec4.vec4_t) : color_matrix_node_t =
  let child = child#as_render_node in
  let color_matrix = color_matrix#as_matrix in
  let color_offset = color_offset#as_vec4 in
  let obj_ = Color_matrix_node.new_ child color_matrix color_offset in
  new color_matrix_node obj_

