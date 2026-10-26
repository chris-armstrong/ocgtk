class type opacity_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_opacity : unit -> float
  method as_opacity_node : Raw.Opacity_node.t
end

class opacity_node : Raw.Opacity_node.t -> opacity_node_t

val new_ : Render_node.render_node_t -> float -> opacity_node_t
