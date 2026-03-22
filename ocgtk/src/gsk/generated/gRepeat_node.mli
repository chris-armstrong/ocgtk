class type repeat_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_child_bounds : unit -> Ocgtk_graphene.Graphene.rect_t
    method as_repeat_node : Repeat_node.t
end

class repeat_node : Repeat_node.t -> repeat_node_t

