class type gl_texture_t = object
  inherit Texture.texture_t
  method release : unit -> unit
  method as_gl_texture : Raw.Gl_texture.t
end

(* High-level class for GLTexture *)
class gl_texture (obj : Raw.Gl_texture.t) : gl_texture_t =
  object (self)
    inherit Texture.texture (obj :> Raw.Texture.t)
    method release : unit -> unit = fun () -> Raw.Gl_texture.release obj
    method as_gl_texture = obj
  end
