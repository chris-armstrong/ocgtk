class type gl_shader_t = object
  method compile : GRenderer.renderer_t -> (bool, GError.t) result
  method find_uniform_by_name : string -> int
  method get_arg_bool : Glib_bytes.t -> int -> bool
  method get_arg_float : Glib_bytes.t -> int -> float
  method get_arg_int : Glib_bytes.t -> int -> Int32.t
  method get_arg_uint : Glib_bytes.t -> int -> UInt32.t

  method get_arg_vec2 :
    Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec2.vec2_t -> unit

  method get_arg_vec3 :
    Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit

  method get_arg_vec4 :
    Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit

  method get_args_size : unit -> Gsize.t
  method get_n_textures : unit -> int
  method get_n_uniforms : unit -> int
  method get_resource : unit -> string option
  method get_source : unit -> Glib_bytes.t
  method get_uniform_name : int -> string
  method get_uniform_offset : int -> int
  method get_uniform_type : int -> Gsk_enums.gluniformtype
  method as_gl_shader : Gl_shader.t
end

(* High-level class for GLShader *)
class gl_shader (obj : Gl_shader.t) : gl_shader_t =
  object (self)
    method compile : GRenderer.renderer_t -> (bool, GError.t) result =
      fun renderer ->
        let renderer = renderer#as_renderer in
        Gl_shader.compile obj renderer

    method find_uniform_by_name : string -> int =
      fun name -> Gl_shader.find_uniform_by_name obj name

    method get_arg_bool : Glib_bytes.t -> int -> bool =
      fun args idx -> Gl_shader.get_arg_bool obj args idx

    method get_arg_float : Glib_bytes.t -> int -> float =
      fun args idx -> Gl_shader.get_arg_float obj args idx

    method get_arg_int : Glib_bytes.t -> int -> Int32.t =
      fun args idx -> Gl_shader.get_arg_int obj args idx

    method get_arg_uint : Glib_bytes.t -> int -> UInt32.t =
      fun args idx -> Gl_shader.get_arg_uint obj args idx

    method get_arg_vec2 :
        Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec2.vec2_t -> unit =
      fun args idx out_value ->
        let out_value = out_value#as_vec2 in
        Gl_shader.get_arg_vec2 obj args idx out_value

    method get_arg_vec3 :
        Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec3.vec3_t -> unit =
      fun args idx out_value ->
        let out_value = out_value#as_vec3 in
        Gl_shader.get_arg_vec3 obj args idx out_value

    method get_arg_vec4 :
        Glib_bytes.t -> int -> Ocgtk_graphene.Graphene.Vec4.vec4_t -> unit =
      fun args idx out_value ->
        let out_value = out_value#as_vec4 in
        Gl_shader.get_arg_vec4 obj args idx out_value

    method get_args_size : unit -> Gsize.t =
      fun () -> Gl_shader.get_args_size obj

    method get_n_textures : unit -> int = fun () -> Gl_shader.get_n_textures obj
    method get_n_uniforms : unit -> int = fun () -> Gl_shader.get_n_uniforms obj

    method get_resource : unit -> string option =
      fun () -> Gl_shader.get_resource obj

    method get_source : unit -> Glib_bytes.t =
      fun () -> Gl_shader.get_source obj

    method get_uniform_name : int -> string =
      fun idx -> Gl_shader.get_uniform_name obj idx

    method get_uniform_offset : int -> int =
      fun idx -> Gl_shader.get_uniform_offset obj idx

    method get_uniform_type : int -> Gsk_enums.gluniformtype =
      fun idx -> Gl_shader.get_uniform_type obj idx

    method as_gl_shader = obj
  end

let new_from_bytes (sourcecode : Glib_bytes.t) : gl_shader_t =
  let obj_ = Gl_shader.new_from_bytes sourcecode in
  new gl_shader obj_

let new_from_resource (resource_path : string) : gl_shader_t =
  let obj_ = Gl_shader.new_from_resource resource_path in
  new gl_shader obj_
