(* GENERATED CODE - DO NOT EDIT *)
(* GLShaderNode: GLShaderNode *)

type t = [`gl_shader_node | `render_node] Gobject.obj

(** Create a new GLShaderNode *)
external new_ : Gl_shader.t -> unit -> unit -> Render_node.t array option -> int -> t = "ml_gsk_gl_shader_node_new"

(* Methods *)
(** Gets shader code for the node. *)
external get_shader : t -> Gl_shader.t = "ml_gsk_gl_shader_node_get_shader"

(** Returns the number of children *)
external get_n_children : t -> int = "ml_gsk_gl_shader_node_get_n_children"

(** Gets one of the children. *)
external get_child : t -> int -> Render_node.t = "ml_gsk_gl_shader_node_get_child"

