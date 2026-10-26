class type cairo_renderer_t = object
  inherit Renderer.renderer_t
  method as_cairo_renderer : Raw.Cairo_renderer.t
end

class cairo_renderer : Raw.Cairo_renderer.t -> cairo_renderer_t

val new_ : unit -> cairo_renderer_t
