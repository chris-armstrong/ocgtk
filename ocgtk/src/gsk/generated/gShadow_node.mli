class type shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_child : unit -> GRender_node.render_node_t
    method get_n_shadows : unit -> Gsize.t
    method get_shadow : Gsize.t -> Shadow.t
    method as_shadow_node : Shadow_node.t
end

class shadow_node : Shadow_node.t -> shadow_node_t

val new_ : GRender_node.render_node_t -> Shadow.t array -> Gsize.t -> shadow_node_t
