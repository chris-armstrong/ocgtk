(** A render node using a GL shader when drawing its children nodes.

    Its methods, signals and properties are on {!class-type-gl_shader_node_t}.
    The functions it is built on are in {!Ocgsk.Raw.Gl_shader_node}. *)

(** The methods, signals and properties of a [GskGLShaderNode]. *)
class type gl_shader_node_t = object
  inherit Render_node.render_node_t
  method get_args : unit -> Glib_bytes.t
  method get_child : int -> Render_node.render_node_t
  method get_n_children : unit -> int
  method get_shader : unit -> Gl_shader.gl_shader_t
  method as_gl_shader_node : Raw.Gl_shader_node.t
end

class gl_shader_node : Raw.Gl_shader_node.t -> gl_shader_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Gl_shader_node.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskGLShaderNode], give one already wrapped. *)

val new_ :
  Gl_shader.gl_shader_t ->
  Ocgraphene.Rect.rect_t ->
  Glib_bytes.t ->
  Raw.Render_node.t array option ->
  int ->
  gl_shader_node_t
