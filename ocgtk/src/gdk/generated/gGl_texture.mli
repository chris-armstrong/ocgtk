class type gl_texture_t = object
  inherit GTexture.texture_t
  method release : unit -> unit
  method as_gl_texture : Gl_texture.t
end

class gl_texture : Gl_texture.t -> gl_texture_t
