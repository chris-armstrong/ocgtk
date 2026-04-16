class type gl_shader_node_t = object
  inherit GRender_node.render_node_t
  method get_args : unit -> Glib_bytes.t
  method get_child : int -> GRender_node.render_node_t
  method get_n_children : unit -> int
  method get_shader : unit -> GGl_shader.gl_shader_t
  method as_gl_shader_node : Gl_shader_node.t
end

(* High-level class for GLShaderNode *)
class gl_shader_node (obj : Gl_shader_node.t) : gl_shader_node_t =
  object (self)
    inherit GRender_node.render_node (obj :> Render_node.t)

    method get_args : unit -> Glib_bytes.t =
      fun () -> Gl_shader_node.get_args obj

    method get_child : int -> GRender_node.render_node_t =
      fun idx -> new GRender_node.render_node (Gl_shader_node.get_child obj idx)

    method get_n_children : unit -> int =
      fun () -> Gl_shader_node.get_n_children obj

    method get_shader : unit -> GGl_shader.gl_shader_t =
      fun () -> new GGl_shader.gl_shader (Gl_shader_node.get_shader obj)

    method as_gl_shader_node = obj
  end

let new_ (shader : GGl_shader.gl_shader_t)
    (bounds : Ocgtk_graphene.Graphene.Rect.rect_t) (args : Glib_bytes.t)
    (children : Render_node.t array option) (n_children : int) :
    gl_shader_node_t =
  let shader = shader#as_gl_shader in
  let bounds = bounds#as_rect in
  let obj_ = Gl_shader_node.new_ shader bounds args children n_children in
  new gl_shader_node obj_
