class type gl_shader_node_t = object
    method get_child : int -> GRender_node.render_node_t
    method get_n_children : unit -> int
    method get_shader : unit -> GGl_shader.gl_shader_t
    method as_gl_shader_node : Gl_shader_node.t
end

class gl_shader_node : Gl_shader_node.t -> gl_shader_node_t

