class type ngl_renderer_t = object
    inherit GRenderer.renderer_t
    method as_ngl_renderer : Ngl_renderer.t
end

class ngl_renderer : Ngl_renderer.t -> ngl_renderer_t

val new_ : unit -> ngl_renderer_t
