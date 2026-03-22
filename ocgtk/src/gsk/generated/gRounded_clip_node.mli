class type rounded_clip_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_clip : unit -> Rounded_rect.t
    method as_rounded_clip_node : Rounded_clip_node.t
end

class rounded_clip_node : Rounded_clip_node.t -> rounded_clip_node_t

