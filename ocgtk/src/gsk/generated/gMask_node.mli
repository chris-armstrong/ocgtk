class type mask_node_t = object
    method get_mask : unit -> GRender_node.render_node_t
    method get_mask_mode : unit -> Gsk_enums.maskmode
    method get_source : unit -> GRender_node.render_node_t
    method as_mask_node : Mask_node.t
end

class mask_node : Mask_node.t -> mask_node_t

