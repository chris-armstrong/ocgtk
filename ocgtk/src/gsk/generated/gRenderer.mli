class type renderer_t = object
  method get_surface : unit -> Ocgtk_gdk.Gdk.Surface.surface_t option
  method is_realized : unit -> bool

  method realize :
    Ocgtk_gdk.Gdk.Surface.surface_t option -> (bool, GError.t) result

  method realize_for_display :
    Ocgtk_gdk.Gdk.Display.display_t -> (bool, GError.t) result

  method render :
    GRender_node.render_node_t ->
    Ocgtk_cairo.Cairo.Region.region_t option ->
    unit

  method render_texture :
    GRender_node.render_node_t ->
    Ocgtk_graphene.Graphene.Rect.rect_t option ->
    Ocgtk_gdk.Gdk.Texture.texture_t

  method unrealize : unit -> unit
  method realized : bool
  method as_renderer : Renderer.t
end

class renderer : Renderer.t -> renderer_t

val new_for_surface : Ocgtk_gdk.Gdk.Surface.surface_t -> renderer_t
