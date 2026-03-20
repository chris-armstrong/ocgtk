class type gl_texture_t = object
    method release : unit -> unit
    method as_gl_texture : Gl_texture.t
end

(* High-level class for GLTexture *)
class gl_texture (obj : Gl_texture.t) : gl_texture_t = object (self)

  method release : unit -> unit =
    fun () ->
      (Gl_texture.release obj)

    method as_gl_texture = obj
end

