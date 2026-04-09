class type gl_shader_t = object
    method compile : GRenderer.renderer_t -> (bool, GError.t) result
    method find_uniform_by_name : string -> int
    method get_arg_bool : Glib_bytes.t -> int -> bool
    method get_arg_float : Glib_bytes.t -> int -> float
    method get_arg_int : Glib_bytes.t -> int -> int32
    method get_arg_uint : Glib_bytes.t -> int -> int
    method get_arg_vec2 : Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec2.vec2_t -> unit
    method get_arg_vec3 : Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit
    method get_arg_vec4 : Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit
    method get_args_size : unit -> int
    method get_n_textures : unit -> int
    method get_n_uniforms : unit -> int
    method get_resource : unit -> string option
    method get_source : unit -> Glib_bytes.t
    method get_uniform_name : int -> string
    method get_uniform_offset : int -> int
    method get_uniform_type : int -> Gsk_enums.gluniformtype
    method as_gl_shader : Gl_shader.t
end

class gl_shader : Gl_shader.t -> gl_shader_t

val new_from_bytes : Glib_bytes.t -> gl_shader_t
val new_from_resource : string -> gl_shader_t
