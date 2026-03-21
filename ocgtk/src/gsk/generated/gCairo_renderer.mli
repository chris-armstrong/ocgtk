class type cairo_renderer_t = object
    method as_cairo_renderer : Cairo_renderer.t
end

class cairo_renderer : Cairo_renderer.t -> cairo_renderer_t

