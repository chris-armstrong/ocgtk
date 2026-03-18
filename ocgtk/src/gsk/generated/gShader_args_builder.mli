class shader_args_builder : Shader_args_builder.t ->
  object
    method ref : unit -> Shader_args_builder.t
    method set_bool : int -> bool -> unit
    method set_float : int -> float -> unit
    method set_vec2 : int -> #Ocgtk_graphene.Graphene.vec2 -> unit
    method set_vec3 : int -> #Ocgtk_graphene.Graphene.vec3 -> unit
    method set_vec4 : int -> #Ocgtk_graphene.Graphene.vec4 -> unit
    method unref : unit -> unit
    method as_shader_args_builder : Shader_args_builder.t
  end

