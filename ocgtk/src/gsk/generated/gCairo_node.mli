class cairo_node : Cairo_node.t ->
  object
    method get_draw_context : unit -> Ocgtk_cairo.Cairo.context
    method get_surface : unit -> Ocgtk_cairo.Cairo.surface
    method as_cairo_node : Cairo_node.t
  end

