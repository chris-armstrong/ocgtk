class type blur_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_radius : unit -> float
  method as_blur_node : Raw.Blur_node.t
end

class blur_node : Raw.Blur_node.t -> blur_node_t

val new_ : Render_node.render_node_t -> float -> blur_node_t
