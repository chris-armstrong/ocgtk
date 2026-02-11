(* High-level class for GLShaderNode *)
class gl_shader_node (obj : Gl_shader_node.t) = object (self)

  method get_child : int -> GRender_node.render_node =
    fun idx ->
      new  GRender_node.render_node(Gl_shader_node.get_child obj idx)

  method get_n_children : unit -> int =
    fun () ->
      (Gl_shader_node.get_n_children obj)

  method get_shader : unit -> GGl_shader.gl_shader =
    fun () ->
      new  GGl_shader.gl_shader(Gl_shader_node.get_shader obj)

    method as_gl_shader_node = obj
end

