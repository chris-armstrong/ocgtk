class shader_args_builder : Shader_args_builder.t ->
  object
    method ref : unit -> Shader_args_builder.t
    method set_bool : int -> bool -> unit
    method set_float : int -> float -> unit
    method unref : unit -> unit
    method as_shader_args_builder : Shader_args_builder.t
  end

