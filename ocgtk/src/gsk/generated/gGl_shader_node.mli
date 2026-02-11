class gl_shader_node : Gl_shader_node.t ->
  object
    method get_child : int -> GRender_node.render_node
    method get_n_children : unit -> int
    method get_shader : unit -> GGl_shader.gl_shader
    method as_gl_shader_node : Gl_shader_node.t
  end

