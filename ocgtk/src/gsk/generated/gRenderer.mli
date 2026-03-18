class renderer : Renderer.t ->
  object
    method get_surface : unit -> Ocgtk_gdk.Gdk.surface option
    method is_realized : unit -> bool
    method realize : #Ocgtk_gdk.Gdk.surface option -> (bool, GError.t) result
    method realize_for_display : #Ocgtk_gdk.Gdk.display -> (bool, GError.t) result
    method render : #GRender_node.render_node -> #Ocgtk_cairo.Cairo.region option -> unit
    method render_texture : #GRender_node.render_node -> #Ocgtk_graphene.Graphene.rect option -> Ocgtk_gdk.Gdk.texture
    method unrealize : unit -> unit
    method realized : bool
    method as_renderer : Renderer.t
  end

