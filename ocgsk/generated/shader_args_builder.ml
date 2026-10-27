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

(* High-level class for ShaderArgsBuilder *)
class shader_args_builder (obj : Raw.Shader_args_builder.t) :
  shader_args_builder_t =
  object (self)
    method ref : unit -> Raw.Shader_args_builder.t =
      fun () -> Raw.Shader_args_builder.ref obj

    method set_bool : int -> bool -> unit =
      fun idx value -> Raw.Shader_args_builder.set_bool obj idx value

    method set_float : int -> float -> unit =
      fun idx value -> Raw.Shader_args_builder.set_float obj idx value

    method set_int : int -> Int32.t -> unit =
      fun idx value -> Raw.Shader_args_builder.set_int obj idx value

    method set_uint : int -> UInt32.t -> unit =
      fun idx value -> Raw.Shader_args_builder.set_uint obj idx value

    method set_vec2 : int -> Ocgraphene.Vec2.vec2_t -> unit =
      fun idx value ->
        let value = value#as_vec2 in
        Raw.Shader_args_builder.set_vec2 obj idx value

    method set_vec3 : int -> Ocgraphene.Vec3.vec3_t -> unit =
      fun idx value ->
        let value = value#as_vec3 in
        Raw.Shader_args_builder.set_vec3 obj idx value

    method set_vec4 : int -> Ocgraphene.Vec4.vec4_t -> unit =
      fun idx value ->
        let value = value#as_vec4 in
        Raw.Shader_args_builder.set_vec4 obj idx value

    method to_args : unit -> Glib_bytes.t =
      fun () -> Raw.Shader_args_builder.to_args obj

    method as_shader_args_builder = obj
  end

let new_ (shader : Gl_shader.gl_shader_t) (initial_values : Glib_bytes.t option)
    : shader_args_builder_t =
  let shader = shader#as_gl_shader in
  let obj_ = Raw.Shader_args_builder.new_ shader initial_values in
  new shader_args_builder obj_
