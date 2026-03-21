class type gl_renderer_t = object
    method as_gl_renderer : Gl_renderer.t
end

(* High-level class for GLRenderer *)
class gl_renderer (obj : Gl_renderer.t) : gl_renderer_t = object (self)

    method as_gl_renderer = obj
end

