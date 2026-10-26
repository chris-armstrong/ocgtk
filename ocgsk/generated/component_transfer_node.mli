class type component_transfer_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_transfer : int -> Raw.Component_transfer.t
  method as_component_transfer_node : Raw.Component_transfer_node.t
end

class component_transfer_node :
  Raw.Component_transfer_node.t ->
  component_transfer_node_t

val new_ :
  Render_node.render_node_t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  component_transfer_node_t
