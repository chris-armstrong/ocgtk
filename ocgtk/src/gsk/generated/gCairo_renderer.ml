(* High-level class for CairoRenderer *)
class cairo_renderer (obj : Cairo_renderer.t) = object (self)

    method as_cairo_renderer = obj
end

