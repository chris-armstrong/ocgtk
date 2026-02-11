class gl_shader : Gl_shader.t ->
  object
    method compile : #GRenderer.renderer -> (bool, GError.t) result
    method find_uniform_by_name : string -> int
    method get_n_textures : unit -> int
    method get_n_uniforms : unit -> int
    method get_resource : unit -> string option
    method get_uniform_name : int -> string
    method get_uniform_offset : int -> int
    method get_uniform_type : int -> Gsk_enums.gluniformtype
    method as_gl_shader : Gl_shader.t
  end

