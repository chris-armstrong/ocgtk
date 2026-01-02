class gl_texture : Gl_texture.t ->
  object
    method release : unit -> unit
    method as_gl_texture : Gl_texture.t
  end

