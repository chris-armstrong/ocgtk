class type gl_renderer_t = object
    inherit GRenderer.renderer_t
    method as_gl_renderer : Gl_renderer.t
end

(* High-level class for GLRenderer *)
class gl_renderer (obj : Gl_renderer.t) : gl_renderer_t = object (self)
  inherit GRenderer.renderer (obj :> Renderer.t)

    method as_gl_renderer = obj
end

let new_ () : gl_renderer_t =
  new gl_renderer (Gl_renderer.new_ ())

