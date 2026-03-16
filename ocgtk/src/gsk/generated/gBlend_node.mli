class blend_node : Blend_node.t ->
  object
    method get_blend_mode : unit -> Gsk_enums.blendmode
    method get_bottom_child : unit -> GRender_node.render_node
    method get_top_child : unit -> GRender_node.render_node
    method as_blend_node : Blend_node.t
  end

