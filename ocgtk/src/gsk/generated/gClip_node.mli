class type clip_node_t = object
    method get_child : unit -> GRender_node.render_node_t
    method get_clip : unit -> Ocgtk_graphene.Graphene.rect_t
    method as_clip_node : Clip_node.t
end

class clip_node : Clip_node.t -> clip_node_t

