class type component_transfer_node_t = object
  inherit GRender_node.render_node_t
  method get_child : unit -> GRender_node.render_node_t
  method get_transfer : int -> Component_transfer.t
  method as_component_transfer_node : Component_transfer_node.t
end

class component_transfer_node :
  Component_transfer_node.t ->
  component_transfer_node_t

val new_ :
  GRender_node.render_node_t ->
  Component_transfer.t ->
  Component_transfer.t ->
  Component_transfer.t ->
  Component_transfer.t ->
  component_transfer_node_t
