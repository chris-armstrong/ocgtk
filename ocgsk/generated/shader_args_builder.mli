(** Builds the uniforms data for a [GskGLShader].

    Its methods, signals and properties are on
    {!class-type-shader_args_builder_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Shader_args_builder}. *)

(** The methods, signals and properties of a [ShaderArgsBuilder]. *)
class type shader_args_builder_t = object
  method ref : unit -> Raw.Shader_args_builder.t
  (** Increases the reference count of a [GskShaderArgsBuilder] by one. *)

  method set_bool : int -> bool -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of bool type. *)

  method set_float : int -> float -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of float type. *)

  method set_int : int -> Int32.t -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of int type. *)

  method set_uint : int -> UInt32.t -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of uint type. *)

  method set_vec2 : int -> Ocgraphene.Vec2.vec2_t -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of vec2 type. *)

  method set_vec3 : int -> Ocgraphene.Vec3.vec3_t -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of vec3 type. *)

  method set_vec4 : int -> Ocgraphene.Vec4.vec4_t -> unit
  (** Sets the value of the uniform [idx].

      The uniform must be of vec4 type. *)

  method to_args : unit -> Glib_bytes.t
  (** Creates a new [GBytes] args from the current state of the given [builder].

      Any uniforms of the shader that have not been explicitly set on the
      [builder] are zero-initialized.

      The given [GskShaderArgsBuilder] is reset once this function returns; you
      cannot call this function multiple times on the same [builder] instance.

      This function is intended primarily for bindings. C code should use
      [Gsk.ShaderArgsBuilder.free_to_args]. *)

  method as_shader_args_builder : Raw.Shader_args_builder.t
end

class shader_args_builder : Raw.Shader_args_builder.t -> shader_args_builder_t
(** Wraps a raw handle of {!Ocgsk.Raw.Shader_args_builder.t}. *)

(** {2:constructors Constructors} *)

val new_ : Gl_shader.gl_shader_t -> Glib_bytes.t option -> shader_args_builder_t
(** Allocates a builder that can be used to construct a new uniform data chunk.
*)
