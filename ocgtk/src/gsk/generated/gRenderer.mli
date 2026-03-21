class type renderer_t = object
    method get_surface : unit -> Ocgtk_gdk.Gdk.surface_t option
    method is_realized : unit -> bool
    method realize : Ocgtk_gdk.Gdk.surface_t option -> (bool, GError.t) result
    method realize_for_display : Ocgtk_gdk.Gdk.display_t -> (bool, GError.t) result
    method render : GRender_node.render_node_t -> Ocgtk_cairo.Cairo.region_t option -> unit
    method render_texture : GRender_node.render_node_t -> Ocgtk_graphene.Graphene.rect_t option -> Ocgtk_gdk.Gdk.texture_t
    method unrealize : unit -> unit
    method realized : bool
    method as_renderer : Renderer.t
end

class renderer : Renderer.t -> renderer_t

