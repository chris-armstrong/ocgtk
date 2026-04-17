class type gl_shader_node_t = object
  inherit GRender_node.render_node_t
  method get_args : unit -> Glib_bytes.t
  method get_child : int -> GRender_node.render_node_t
  method get_n_children : unit -> int
  method get_shader : unit -> GGl_shader.gl_shader_t
  method as_gl_shader_node : Gl_shader_node.t
end

class gl_shader_node : Gl_shader_node.t -> gl_shader_node_t

val new_ :
  GGl_shader.gl_shader_t ->
  Ocgtk_graphene.Graphene.Rect.rect_t ->
  Glib_bytes.t ->
  Render_node.t array option ->
  int ->
  gl_shader_node_t
