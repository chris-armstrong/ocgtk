(* High-level class for GLTexture *)
class gl_texture (obj : Gl_texture.t) = object (self)

  method release : unit -> unit =
    fun () ->
      (Gl_texture.release obj)

    method as_gl_texture = obj
end

