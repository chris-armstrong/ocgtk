class type transform_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_transform : unit -> Transform.t
    method as_transform_node : Transform_node.t
end

class transform_node : Transform_node.t -> transform_node_t

