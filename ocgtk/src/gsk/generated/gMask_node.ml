class type mask_node_t = object
    method get_mask : unit -> GRender_node.render_node_t
    method get_mask_mode : unit -> Gsk_enums.maskmode
    method get_source : unit -> GRender_node.render_node_t
    method as_mask_node : Mask_node.t
end

(* High-level class for MaskNode *)
class mask_node (obj : Mask_node.t) : mask_node_t = object (self)

  method get_mask : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Mask_node.get_mask obj)

  method get_mask_mode : unit -> Gsk_enums.maskmode =
    fun () ->
      (Mask_node.get_mask_mode obj)

  method get_source : unit -> GRender_node.render_node_t =
    fun () ->
      new  GRender_node.render_node(Mask_node.get_source obj)

    method as_mask_node = obj
end

