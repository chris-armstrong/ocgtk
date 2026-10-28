class type gl_shader_t = object
  (** {2:methods Methods} *)

  method compile : Renderer.renderer_t -> (bool, GError.t) result
  (** Tries to compile the [shader] for the given [renderer].

      If there is a problem, this function returns [FALSE] and reports an error.
      You should use this function before relying on the shader for rendering
      and use a fallback with a simpler shader or without shaders if it fails.

      Note that this will modify the rendering state (for example change the
      current GL context) and requires the renderer to be set up. This means
      that the widget has to be realized. Commonly you want to call this from
      the realize signal of a widget, or during widget snapshot. *)

  method find_uniform_by_name : string -> int
  (** Looks for a uniform by the name [name], and returns the index of the
      uniform, or -1 if it was not found. *)

  method get_arg_bool : Glib_bytes.t -> int -> bool
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of bool type. *)

  method get_arg_float : Glib_bytes.t -> int -> float
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of float type. *)

  method get_arg_int : Glib_bytes.t -> int -> Int32.t
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of int type. *)

  method get_arg_uint : Glib_bytes.t -> int -> UInt32.t
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of uint type. *)

  method get_arg_vec2 : Glib_bytes.t -> int -> Ocgraphene.Vec2.vec2_t -> unit
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of vec2 type. *)

  method get_arg_vec3 : Glib_bytes.t -> int -> Ocgraphene.Vec3.vec3_t -> unit
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of vec3 type. *)

  method get_arg_vec4 : Glib_bytes.t -> int -> Ocgraphene.Vec4.vec4_t -> unit
  (** Gets the value of the uniform [idx] in the [args] block.

      The uniform must be of vec4 type. *)

  method get_args_size : unit -> Gsize.t
  (** Get the size of the data block used to specify arguments for this shader.
  *)

  method get_n_textures : unit -> int
  (** Returns the number of textures that the shader requires.

      This can be used to check that the a passed shader works in your usecase.
      It is determined by looking at the highest u_textureN value that the
      shader defines. *)

  method get_n_uniforms : unit -> int
  (** Get the number of declared uniforms for this shader. *)

  method get_resource : unit -> string option
  (** Gets the resource path for the GLSL sourcecode being used to render this
      shader. *)

  method get_source : unit -> Glib_bytes.t
  (** Gets the GLSL sourcecode being used to render this shader. *)

  method get_uniform_name : int -> string
  (** Get the name of the declared uniform for this shader at index [idx]. *)

  method get_uniform_offset : int -> int
  (** Get the offset into the data block where data for this uniforms is stored.
  *)

  method get_uniform_type : int -> Enums.gluniformtype
  (** Get the type of the declared uniform for this shader at index [idx]. *)

  (** {2:conversions Conversions} *)

  method as_gl_shader : Raw.Gl_shader.t
end

(* High-level class for GLShader *)
class gl_shader (obj : Raw.Gl_shader.t) : gl_shader_t =
  object (self)
    method compile : Renderer.renderer_t -> (bool, GError.t) result =
      fun renderer ->
        let renderer = renderer#as_renderer in
        Raw.Gl_shader.compile obj renderer

    method find_uniform_by_name : string -> int =
      fun name -> Raw.Gl_shader.find_uniform_by_name obj name

    method get_arg_bool : Glib_bytes.t -> int -> bool =
      fun args idx -> Raw.Gl_shader.get_arg_bool obj args idx

    method get_arg_float : Glib_bytes.t -> int -> float =
      fun args idx -> Raw.Gl_shader.get_arg_float obj args idx

    method get_arg_int : Glib_bytes.t -> int -> Int32.t =
      fun args idx -> Raw.Gl_shader.get_arg_int obj args idx

    method get_arg_uint : Glib_bytes.t -> int -> UInt32.t =
      fun args idx -> Raw.Gl_shader.get_arg_uint obj args idx

    method get_arg_vec2 : Glib_bytes.t -> int -> Ocgraphene.Vec2.vec2_t -> unit
        =
      fun args idx out_value ->
        let out_value = out_value#as_vec2 in
        Raw.Gl_shader.get_arg_vec2 obj args idx out_value

    method get_arg_vec3 : Glib_bytes.t -> int -> Ocgraphene.Vec3.vec3_t -> unit
        =
      fun args idx out_value ->
        let out_value = out_value#as_vec3 in
        Raw.Gl_shader.get_arg_vec3 obj args idx out_value

    method get_arg_vec4 : Glib_bytes.t -> int -> Ocgraphene.Vec4.vec4_t -> unit
        =
      fun args idx out_value ->
        let out_value = out_value#as_vec4 in
        Raw.Gl_shader.get_arg_vec4 obj args idx out_value

    method get_args_size : unit -> Gsize.t =
      fun () -> Raw.Gl_shader.get_args_size obj

    method get_n_textures : unit -> int =
      fun () -> Raw.Gl_shader.get_n_textures obj

    method get_n_uniforms : unit -> int =
      fun () -> Raw.Gl_shader.get_n_uniforms obj

    method get_resource : unit -> string option =
      fun () -> Raw.Gl_shader.get_resource obj

    method get_source : unit -> Glib_bytes.t =
      fun () -> Raw.Gl_shader.get_source obj

    method get_uniform_name : int -> string =
      fun idx -> Raw.Gl_shader.get_uniform_name obj idx

    method get_uniform_offset : int -> int =
      fun idx -> Raw.Gl_shader.get_uniform_offset obj idx

    method get_uniform_type : int -> Enums.gluniformtype =
      fun idx -> Raw.Gl_shader.get_uniform_type obj idx

    method as_gl_shader = obj
  end

let new_from_bytes (sourcecode : Glib_bytes.t) : gl_shader_t =
  let obj_ = Raw.Gl_shader.new_from_bytes sourcecode in
  new gl_shader obj_

let new_from_resource (resource_path : string) : gl_shader_t =
  let obj_ = Raw.Gl_shader.new_from_resource resource_path in
  new gl_shader obj_
