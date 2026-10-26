class type gl_shader_node_t = object
  inherit Render_node.render_node_t
  method get_args : unit -> Glib_bytes.t
  method get_child : int -> Render_node.render_node_t
  method get_n_children : unit -> int
  method get_shader : unit -> Gl_shader.gl_shader_t
  method as_gl_shader_node : Raw.Gl_shader_node.t
end

class gl_shader_node : Raw.Gl_shader_node.t -> gl_shader_node_t

val new_ :
  Gl_shader.gl_shader_t ->
  Ocgraphene.Rect.rect_t ->
  Glib_bytes.t ->
  Raw.Render_node.t array option ->
  int ->
  gl_shader_node_t
