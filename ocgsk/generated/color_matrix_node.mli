class type color_matrix_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_color_matrix : unit -> Ocgraphene.Matrix.matrix_t
  method get_color_offset : unit -> Ocgraphene.Vec4.vec4_t
  method as_color_matrix_node : Raw.Color_matrix_node.t
end

class color_matrix_node : Raw.Color_matrix_node.t -> color_matrix_node_t

val new_ :
  Render_node.render_node_t ->
  Ocgraphene.Matrix.matrix_t ->
  Ocgraphene.Vec4.vec4_t ->
  color_matrix_node_t
