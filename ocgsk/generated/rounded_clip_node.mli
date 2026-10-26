class type rounded_clip_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_clip : unit -> Raw.Rounded_rect.t
  method as_rounded_clip_node : Raw.Rounded_clip_node.t
end

class rounded_clip_node : Raw.Rounded_clip_node.t -> rounded_clip_node_t

val new_ :
  Render_node.render_node_t -> Raw.Rounded_rect.t -> rounded_clip_node_t
