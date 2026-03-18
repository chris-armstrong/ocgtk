(* GENERATED CODE - DO NOT EDIT *)
(* ShaderArgsBuilder: ShaderArgsBuilder *)

(** An object to build the uniforms data for a `GskGLShader`. *)
type t = [`shader_args_builder] Gobject.obj

(** Create a new ShaderArgsBuilder *)
external new_ : Gl_shader.t -> unit -> t = "ml_gsk_shader_args_builder_new"

(* Methods *)
(** Decreases the reference count of a `GskShaderArgBuilder` by one.

If the resulting reference count is zero, frees the builder. *)
external unref : t -> unit = "ml_gsk_shader_args_builder_unref"

(** Sets the value of the uniform @idx.

The uniform must be of vec4 type. *)
external set_vec4 : t -> int -> Ocgtk_graphene.Graphene.Wrappers.Vec4.t -> unit = "ml_gsk_shader_args_builder_set_vec4"

(** Sets the value of the uniform @idx.

The uniform must be of vec3 type. *)
external set_vec3 : t -> int -> Ocgtk_graphene.Graphene.Wrappers.Vec3.t -> unit = "ml_gsk_shader_args_builder_set_vec3"

(** Sets the value of the uniform @idx.

The uniform must be of vec2 type. *)
external set_vec2 : t -> int -> Ocgtk_graphene.Graphene.Wrappers.Vec2.t -> unit = "ml_gsk_shader_args_builder_set_vec2"

(** Sets the value of the uniform @idx.

The uniform must be of float type. *)
external set_float : t -> int -> float -> unit = "ml_gsk_shader_args_builder_set_float"

(** Sets the value of the uniform @idx.

The uniform must be of bool type. *)
external set_bool : t -> int -> bool -> unit = "ml_gsk_shader_args_builder_set_bool"

(** Increases the reference count of a `GskShaderArgsBuilder` by one. *)
external ref : t -> t = "ml_gsk_shader_args_builder_ref"

