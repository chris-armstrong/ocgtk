class type texture_node_t = object
    inherit GRender_node.render_node_t
    method get_texture : unit -> Ocgtk_gdk.Gdk.Texture.texture_t
    method as_texture_node : Texture_node.t
end

class texture_node : Texture_node.t -> texture_node_t

val new_ : Ocgtk_gdk.Gdk.Texture.texture_t -> Ocgtk_graphene.Graphene.Rect.rect_t -> texture_node_t
