class type cairo_node_t = object
  inherit Render_node.render_node_t
  method get_draw_context : unit -> Occairo.Context.context_t
  method get_surface : unit -> Occairo.Surface.surface_t
  method as_cairo_node : Raw.Cairo_node.t
end

class cairo_node : Raw.Cairo_node.t -> cairo_node_t

val new_ : Ocgraphene.Rect.rect_t -> cairo_node_t
