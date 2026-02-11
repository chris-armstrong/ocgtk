class mask_node : Mask_node.t ->
  object
    method get_mask : unit -> GRender_node.render_node
    method get_mask_mode : unit -> Gsk_enums.maskmode
    method get_source : unit -> GRender_node.render_node
    method as_mask_node : Mask_node.t
  end

