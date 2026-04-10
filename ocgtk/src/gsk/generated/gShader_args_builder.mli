class type shader_args_builder_t = object
    method ref : unit -> Shader_args_builder.t
    method set_bool : int -> bool -> unit
    method set_float : int -> float -> unit
    method set_int : int -> int32 -> unit
    method set_uint : int -> int -> unit
    method set_vec2 : int -> Ocgtk_graphene.Graphene.Vec2.vec2_t -> unit
    method set_vec3 : int -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit
    method set_vec4 : int -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit
    method to_args : unit -> Glib_bytes.t
    method unref : unit -> unit
    method as_shader_args_builder : Shader_args_builder.t
end

class shader_args_builder : Shader_args_builder.t -> shader_args_builder_t

val new_ : GGl_shader.gl_shader_t -> Glib_bytes.t option -> shader_args_builder_t
