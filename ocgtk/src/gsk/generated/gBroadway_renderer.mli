class type broadway_renderer_t = object
    inherit GRenderer.renderer_t
    method as_broadway_renderer : Broadway_renderer.t
end

class broadway_renderer : Broadway_renderer.t -> broadway_renderer_t

val new_ : unit -> broadway_renderer_t
