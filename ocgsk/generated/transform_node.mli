class type transform_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_transform : unit -> Raw.Transform.t
  method as_transform_node : Raw.Transform_node.t
end

class transform_node : Raw.Transform_node.t -> transform_node_t

val new_ : Render_node.render_node_t -> Raw.Transform.t -> transform_node_t
