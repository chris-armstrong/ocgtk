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

  method unref : unit -> unit =
    fun () ->
      (Shader_args_builder.unref obj)

    method as_shader_args_builder = obj
end

