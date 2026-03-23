class type gl_shader_node_t = object
    inherit GRender_node.render_node_t
    method get_child : int -> GRender_node.render_node_t
    method get_n_children : unit -> int
    method get_shader : unit -> GGl_shader.gl_shader_t
    method as_gl_shader_node : Gl_shader_node.t
end

(* High-level class for GLShaderNode *)
class gl_shader_node (obj : Gl_shader_node.t) : gl_shader_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_child : int -> GRender_node.render_node_t =
    fun idx ->
      new  GRender_node.render_node(Gl_shader_node.get_child obj idx)

  method get_n_children : unit -> int =
    fun () ->
      (Gl_shader_node.get_n_children obj)

  method get_shader : unit -> GGl_shader.gl_shader_t =
    fun () ->
      new  GGl_shader.gl_shader(Gl_shader_node.get_shader obj)

    method as_gl_shader_node = obj
end

