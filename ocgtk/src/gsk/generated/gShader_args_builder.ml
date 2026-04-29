class type shader_args_builder_t = object
  method ref : unit -> Shader_args_builder.t
  method set_bool : int -> bool -> unit
  method set_float : int -> float -> unit
  method set_int : int -> Int32.t -> unit
  method set_uint : int -> UInt32.t -> unit
  method set_vec2 : int -> Ocgtk_graphene.Graphene.Vec2.vec2_t -> unit
  method set_vec3 : int -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit
  method set_vec4 : int -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit
  method to_args : unit -> Glib_bytes.t
  method as_shader_args_builder : Shader_args_builder.t
end

(* High-level class for ShaderArgsBuilder *)
class shader_args_builder (obj : Shader_args_builder.t) : shader_args_builder_t
  =
  object (self)
    method ref : unit -> Shader_args_builder.t =
      fun () -> Shader_args_builder.ref obj

    method set_bool : int -> bool -> unit =
      fun idx value -> Shader_args_builder.set_bool obj idx value

    method set_float : int -> float -> unit =
      fun idx value -> Shader_args_builder.set_float obj idx value

    method set_int : int -> Int32.t -> unit =
      fun idx value -> Shader_args_builder.set_int obj idx value

    method set_uint : int -> UInt32.t -> unit =
      fun idx value -> Shader_args_builder.set_uint obj idx value

    method set_vec2 : int -> Ocgtk_graphene.Graphene.Vec2.vec2_t -> unit =
      fun idx value ->
        let value = value#as_vec2 in
        Shader_args_builder.set_vec2 obj idx value

    method set_vec3 : int -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit =
      fun idx value ->
        let value = value#as_vec3 in
        Shader_args_builder.set_vec3 obj idx value

    method set_vec4 : int -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit =
      fun idx value ->
        let value = value#as_vec4 in
        Shader_args_builder.set_vec4 obj idx value

    method to_args : unit -> Glib_bytes.t =
      fun () -> Shader_args_builder.to_args obj

    method as_shader_args_builder = obj
  end

let new_ (shader : GGl_shader.gl_shader_t)
    (initial_values : Glib_bytes.t option) : shader_args_builder_t =
  let shader = shader#as_gl_shader in
  let obj_ = Shader_args_builder.new_ shader initial_values in
  new shader_args_builder obj_
