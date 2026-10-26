class type blur_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method get_radius : unit -> float
  method as_blur_node : Blur_node.t
end

class blur_node : Blur_node.t -> blur_node_t

val new_ : GRender_node.render_node_t -> float -> blur_node_t
