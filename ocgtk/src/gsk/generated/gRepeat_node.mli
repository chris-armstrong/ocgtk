class type repeat_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_child_bounds : unit -> Ocgtk_graphene.Graphene.Rect.rect_t
    method as_repeat_node : Repeat_node.t
end

class repeat_node : Repeat_node.t -> repeat_node_t

val new_ : Ocgtk_graphene.Graphene.Rect.rect_t -> GRender_node.render_node_t -> Ocgtk_graphene.Graphene.Rect.rect_t option -> repeat_node_t
