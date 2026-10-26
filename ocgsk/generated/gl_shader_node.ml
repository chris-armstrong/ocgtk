class type gl_shader_node_t = object
  inherit Render_node.render_node_t
  method get_args : unit -> Glib_bytes.t
  method get_child : int -> Render_node.render_node_t
  method get_n_children : unit -> int
  method get_shader : unit -> Gl_shader.gl_shader_t
  method as_gl_shader_node : Raw.Gl_shader_node.t
end

(* High-level class for GLShaderNode *)
class gl_shader_node (obj : Raw.Gl_shader_node.t) : gl_shader_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_args : unit -> Glib_bytes.t =
      fun () -> Raw.Gl_shader_node.get_args obj

    method get_child : int -> Render_node.render_node_t =
      fun idx ->
        new Render_node.render_node (Raw.Gl_shader_node.get_child obj idx)

    method get_n_children : unit -> int =
      fun () -> Raw.Gl_shader_node.get_n_children obj

    method get_shader : unit -> Gl_shader.gl_shader_t =
      fun () -> new Gl_shader.gl_shader (Raw.Gl_shader_node.get_shader obj)

    method as_gl_shader_node = obj
  end

let new_ (shader : Gl_shader.gl_shader_t) (bounds : Ocgraphene.Rect.rect_t)
    (args : Glib_bytes.t) (children : Raw.Render_node.t array option)
    (n_children : int) : gl_shader_node_t =
  let shader = shader#as_gl_shader in
  let bounds = bounds#as_rect in
  let obj_ = Raw.Gl_shader_node.new_ shader bounds args children n_children in
  new gl_shader_node obj_
