(** Builds the uniforms data for a [GskGLShader].

    Its methods, signals and properties are on
    {!class-type-shader_args_builder_t}. The functions it is built on are in
    {!Ocgsk.Raw.Shader_args_builder}. *)

(** The methods, signals and properties of a [GskShaderArgsBuilder]. *)
class type shader_args_builder_t = object
  method ref : unit -> Raw.Shader_args_builder.t
  method set_bool : int -> bool -> unit
  method set_float : int -> float -> unit
  method set_int : int -> Int32.t -> unit
  method set_uint : int -> UInt32.t -> unit
  method set_vec2 : int -> Ocgraphene.Vec2.vec2_t -> unit
  method set_vec3 : int -> Ocgraphene.Vec3.vec3_t -> unit
  method set_vec4 : int -> Ocgraphene.Vec4.vec4_t -> unit
  method to_args : unit -> Glib_bytes.t
  method as_shader_args_builder : Raw.Shader_args_builder.t
end

class shader_args_builder : Raw.Shader_args_builder.t -> shader_args_builder_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Shader_args_builder.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GskShaderArgsBuilder], give one already wrapped. *)

val new_ : Gl_shader.gl_shader_t -> Glib_bytes.t option -> shader_args_builder_t
