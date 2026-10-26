class type cairo_renderer_t = object
  inherit Renderer.renderer_t
  method as_cairo_renderer : Raw.Cairo_renderer.t
end

(* High-level class for CairoRenderer *)
class cairo_renderer (obj : Raw.Cairo_renderer.t) : cairo_renderer_t =
  object (self)
    inherit Renderer.renderer (obj :> Raw.Renderer.t)
    method as_cairo_renderer = obj
  end

let new_ () : cairo_renderer_t = new cairo_renderer (Raw.Cairo_renderer.new_ ())
