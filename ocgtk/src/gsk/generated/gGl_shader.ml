(* High-level class for GLShader *)
class gl_shader (obj : Gl_shader.t) = object (self)

  method compile : 'p1. (#GRenderer.renderer as 'p1) -> (bool, GError.t) result =
    fun renderer ->
      let renderer = renderer#as_renderer in
      (Gl_shader.compile obj renderer)

  method find_uniform_by_name : string -> int =
    fun name ->
      (Gl_shader.find_uniform_by_name obj name)

  method get_n_textures : unit -> int =
    fun () ->
      (Gl_shader.get_n_textures obj)

  method get_n_uniforms : unit -> int =
    fun () ->
      (Gl_shader.get_n_uniforms obj)

  method get_resource : unit -> string option =
    fun () ->
      (Gl_shader.get_resource obj)

  method get_uniform_name : int -> string =
    fun idx ->
      (Gl_shader.get_uniform_name obj idx)

  method get_uniform_offset : int -> int =
    fun idx ->
      (Gl_shader.get_uniform_offset obj idx)

  method get_uniform_type : int -> Gsk_enums.gluniformtype =
    fun idx ->
      (Gl_shader.get_uniform_type obj idx)

    method as_gl_shader = obj
end

