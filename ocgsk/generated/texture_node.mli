class type texture_node_t = object
  inherit Render_node.render_node_t
  method get_texture : unit -> Ocgdk.Texture.texture_t
  method as_texture_node : Raw.Texture_node.t
end

class texture_node : Raw.Texture_node.t -> texture_node_t

val new_ : Ocgdk.Texture.texture_t -> Ocgraphene.Rect.rect_t -> texture_node_t
