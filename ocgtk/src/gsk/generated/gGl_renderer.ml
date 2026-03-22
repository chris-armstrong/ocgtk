class type gl_renderer_t = object
    inherit GRenderer.renderer_t
    method as_gl_renderer : Gl_renderer.t
end

(* High-level class for GLRenderer *)
class gl_renderer (obj : Gl_renderer.t) : gl_renderer_t = object (self)
  inherit GRenderer.renderer (Obj.magic obj : Renderer.t)

    method as_gl_renderer = obj
end

