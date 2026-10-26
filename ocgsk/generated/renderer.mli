class type renderer_t = object
  method get_surface : unit -> Ocgdk.Surface.surface_t option
  method is_realized : unit -> bool
  method realize : Ocgdk.Surface.surface_t option -> (bool, GError.t) result

  method realize_for_display :
    Ocgdk.Display.display_t -> (bool, GError.t) result

  method render :
    Render_node.render_node_t -> Occairo.Region.region_t option -> unit

  method render_texture :
    Render_node.render_node_t ->
    Ocgraphene.Rect.rect_t option ->
    Ocgdk.Texture.texture_t

  method unrealize : unit -> unit
  method as_renderer : Raw.Renderer.t
end

class renderer : Raw.Renderer.t -> renderer_t

val new_for_surface : Ocgdk.Surface.surface_t -> renderer_t
