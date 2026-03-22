class type cairo_renderer_t = object
    inherit GRenderer.renderer_t
    method as_cairo_renderer : Cairo_renderer.t
end

(* High-level class for CairoRenderer *)
class cairo_renderer (obj : Cairo_renderer.t) : cairo_renderer_t = object (self)
  inherit GRenderer.renderer (Obj.magic obj : Renderer.t)

    method as_cairo_renderer = obj
end

let new_ () : cairo_renderer_t =
  new cairo_renderer (Cairo_renderer.new_ ())

