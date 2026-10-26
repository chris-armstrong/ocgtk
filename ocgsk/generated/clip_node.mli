class type clip_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_clip : unit -> Ocgraphene.Rect.rect_t
  method as_clip_node : Raw.Clip_node.t
end

class clip_node : Raw.Clip_node.t -> clip_node_t

val new_ : Render_node.render_node_t -> Ocgraphene.Rect.rect_t -> clip_node_t
