class type shader_args_builder_t = object
    method ref : unit -> Shader_args_builder.t
    method set_bool : int -> bool -> unit
    method set_float : int -> float -> unit
    method set_vec2 : int -> Ocgtk_graphene.Graphene.vec2_t -> unit
    method set_vec3 : int -> Ocgtk_graphene.Graphene.vec3_t -> unit
    method set_vec4 : int -> Ocgtk_graphene.Graphene.vec4_t -> unit
    method unref : unit -> unit
    method as_shader_args_builder : Shader_args_builder.t
end

(* High-level class for ShaderArgsBuilder *)
class shader_args_builder (obj : Shader_args_builder.t) : shader_args_builder_t = object (self)

  method ref : unit -> Shader_args_builder.t =
    fun () ->
      (Shader_args_builder.ref obj)

  method set_bool : int -> bool -> unit =
    fun idx value ->
      (Shader_args_builder.set_bool obj idx value)

  method set_float : int -> float -> unit =
    fun idx value ->
      (Shader_args_builder.set_float obj idx value)

  method set_vec2 : int -> Ocgtk_graphene.Graphene.vec2_t -> unit =
    fun idx value ->
      let value = value#as_vec2 in
      (Shader_args_builder.set_vec2 obj idx value)

  method set_vec3 : int -> Ocgtk_graphene.Graphene.vec3_t -> unit =
    fun idx value ->
      let value = value#as_vec3 in
      (Shader_args_builder.set_vec3 obj idx value)

  method set_vec4 : int -> Ocgtk_graphene.Graphene.vec4_t -> unit =
    fun idx value ->
      let value = value#as_vec4 in
      (Shader_args_builder.set_vec4 obj idx value)

  method unref : unit -> unit =
    fun () ->
      (Shader_args_builder.unref obj)

    method as_shader_args_builder = obj
end

