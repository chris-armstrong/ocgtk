class type cross_fade_node_t = object
  inherit Render_node.render_node_t
  method get_end_child : unit -> Render_node.render_node_t
  method get_progress : unit -> float
  method get_start_child : unit -> Render_node.render_node_t
  method as_cross_fade_node : Raw.Cross_fade_node.t
end

class cross_fade_node : Raw.Cross_fade_node.t -> cross_fade_node_t

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  float ->
  cross_fade_node_t
