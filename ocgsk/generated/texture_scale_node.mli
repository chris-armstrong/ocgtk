class type texture_scale_node_t = object
  inherit Render_node.render_node_t
  method get_filter : unit -> Enums.scalingfilter
  method get_texture : unit -> Ocgdk.Texture.texture_t
  method as_texture_scale_node : Raw.Texture_scale_node.t
end

class texture_scale_node : Raw.Texture_scale_node.t -> texture_scale_node_t

val new_ :
  Ocgdk.Texture.texture_t ->
  Ocgraphene.Rect.rect_t ->
  Enums.scalingfilter ->
  texture_scale_node_t
