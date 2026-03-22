class type gl_renderer_t = object
    inherit GRenderer.renderer_t
    method as_gl_renderer : Gl_renderer.t
end

class gl_renderer : Gl_renderer.t -> gl_renderer_t

