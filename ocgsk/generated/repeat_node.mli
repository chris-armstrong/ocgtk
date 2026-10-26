class type repeat_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_child_bounds : unit -> Ocgraphene.Rect.rect_t
  method as_repeat_node : Raw.Repeat_node.t
end

class repeat_node : Raw.Repeat_node.t -> repeat_node_t

val new_ :
  Ocgraphene.Rect.rect_t ->
  Render_node.render_node_t ->
  Ocgraphene.Rect.rect_t option ->
  repeat_node_t
