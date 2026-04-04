class type ngl_renderer_t = object
    inherit GRenderer.renderer_t
    method as_ngl_renderer : Ngl_renderer.t
end

(* High-level class for NglRenderer *)
class ngl_renderer (obj : Ngl_renderer.t) : ngl_renderer_t = object (self)
  inherit GRenderer.renderer (obj :> Renderer.t)

    method as_ngl_renderer = obj
end

let new_ () : ngl_renderer_t =
  new ngl_renderer (Ngl_renderer.new_ ())

