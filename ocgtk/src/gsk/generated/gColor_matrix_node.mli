class type color_matrix_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method get_color_matrix : unit -> Ocgtk_graphene.Graphene.Matrix.matrix_t
  method get_color_offset : unit -> Ocgtk_graphene.Graphene.Vec4.vec4_t
  method as_color_matrix_node : Color_matrix_node.t
end

class color_matrix_node : Color_matrix_node.t -> color_matrix_node_t

val new_ :
  GRender_node.render_node_t ->
  Ocgtk_graphene.Graphene.Matrix.matrix_t ->
  Ocgtk_graphene.Graphene.Vec4.vec4_t ->
  color_matrix_node_t
