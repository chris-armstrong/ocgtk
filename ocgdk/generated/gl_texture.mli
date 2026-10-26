class type gl_texture_t = object
  inherit Texture.texture_t
  method release : unit -> unit
  method as_gl_texture : Raw.Gl_texture.t
end

class gl_texture : Raw.Gl_texture.t -> gl_texture_t
