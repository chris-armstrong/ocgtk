class type blend_node_t = object
    inherit GRender_node.render_node_t
    method get_blend_mode : unit -> Gsk_enums.blendmode
    method get_bottom_child : unit -> GRender_node.render_node_t
    method get_top_child : unit -> GRender_node.render_node_t
    method as_blend_node : Blend_node.t
end

class blend_node : Blend_node.t -> blend_node_t

val new_ : GRender_node.render_node_t -> GRender_node.render_node_t -> Gsk_enums.blendmode -> blend_node_t
