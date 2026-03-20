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

class shader_args_builder : Shader_args_builder.t -> shader_args_builder_t

