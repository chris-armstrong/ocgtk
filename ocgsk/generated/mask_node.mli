class type mask_node_t = object
  inherit Render_node.render_node_t
  method get_mask : unit -> Render_node.render_node_t
  method get_mask_mode : unit -> Enums.maskmode
  method get_source : unit -> Render_node.render_node_t
  method as_mask_node : Raw.Mask_node.t
end

class mask_node : Raw.Mask_node.t -> mask_node_t

val new_ :
  Render_node.render_node_t ->
  Render_node.render_node_t ->
  Enums.maskmode ->
  mask_node_t
