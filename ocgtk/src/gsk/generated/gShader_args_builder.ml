(* High-level class for ShaderArgsBuilder *)
class shader_args_builder (obj : Shader_args_builder.t) = object (self)

  method ref : unit -> Shader_args_builder.t =
    fun () ->
      (Shader_args_builder.ref obj)

  method set_bool : int -> bool -> unit =
    fun idx value ->
      (Shader_args_builder.set_bool obj idx value)

  method set_float : int -> float -> unit =
    fun idx value ->
      (Shader_args_builder.set_float obj idx value)

  method set_vec2 : 'p1. int -> (#Ocgtk_graphene.Graphene.vec2 as 'p1) -> unit =
    fun idx value ->
      let value = value#as_vec2 in
      (Shader_args_builder.set_vec2 obj idx value)

  method set_vec3 : 'p1. int -> (#Ocgtk_graphene.Graphene.vec3 as 'p1) -> unit =
    fun idx value ->
      let value = value#as_vec3 in
      (Shader_args_builder.set_vec3 obj idx value)

  method set_vec4 : 'p1. int -> (#Ocgtk_graphene.Graphene.vec4 as 'p1) -> unit =
    fun idx value ->
      let value = value#as_vec4 in
      (Shader_args_builder.set_vec4 obj idx value)

  method unref : unit -> unit =
    fun () ->
      (Shader_args_builder.unref obj)

    method as_shader_args_builder = obj
end

