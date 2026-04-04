class type broadway_renderer_t = object
    inherit GRenderer.renderer_t
    method as_broadway_renderer : Broadway_renderer.t
end

(* High-level class for BroadwayRenderer *)
class broadway_renderer (obj : Broadway_renderer.t) : broadway_renderer_t = object (self)
  inherit GRenderer.renderer (obj :> Renderer.t)

    method as_broadway_renderer = obj
end

let new_ () : broadway_renderer_t =
  new broadway_renderer (Broadway_renderer.new_ ())

