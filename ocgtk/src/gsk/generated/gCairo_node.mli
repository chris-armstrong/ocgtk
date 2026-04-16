class type cairo_node_t = object
  inherit GRender_node.render_node_t
  method get_draw_context : unit -> Ocgtk_cairo.Cairo.Context.context_t
  method get_surface : unit -> Ocgtk_cairo.Cairo.Surface.surface_t
  method as_cairo_node : Cairo_node.t
end

class cairo_node : Cairo_node.t -> cairo_node_t

val new_ : Ocgtk_graphene.Graphene.Rect.rect_t -> cairo_node_t
