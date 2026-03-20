class type cairo_node_t = object
    method get_draw_context : unit -> Ocgtk_cairo.Cairo.context_t
    method get_surface : unit -> Ocgtk_cairo.Cairo.surface_t
    method as_cairo_node : Cairo_node.t
end

(* High-level class for CairoNode *)
class cairo_node (obj : Cairo_node.t) : cairo_node_t = object (self)

  method get_draw_context : unit -> Ocgtk_cairo.Cairo.context_t =
    fun () ->
      new  Ocgtk_cairo.Cairo.context(Cairo_node.get_draw_context obj)

  method get_surface : unit -> Ocgtk_cairo.Cairo.surface_t =
    fun () ->
      new  Ocgtk_cairo.Cairo.surface(Cairo_node.get_surface obj)

    method as_cairo_node = obj
end

