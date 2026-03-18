(* High-level class for CairoNode *)
class cairo_node (obj : Cairo_node.t) = object (self)

  method get_draw_context : unit -> Ocgtk_cairo.Cairo.context =
    fun () ->
      new  Ocgtk_cairo.Cairo.context(Cairo_node.get_draw_context obj)

  method get_surface : unit -> Ocgtk_cairo.Cairo.surface =
    fun () ->
      new  Ocgtk_cairo.Cairo.surface(Cairo_node.get_surface obj)

    method as_cairo_node = obj
end

