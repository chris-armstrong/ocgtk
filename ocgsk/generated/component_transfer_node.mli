(** Bindings for [GskComponentTransferNode].

    Its methods, signals and properties are on
    {!class-type-component_transfer_node_t}. The functions it is built on are in
    {!Ocgsk.Raw.Component_transfer_node}. *)

(** The methods, signals and properties of a [GskComponentTransferNode]. *)
class type component_transfer_node_t = object
  inherit Render_node.render_node_t
  method get_child : unit -> Render_node.render_node_t
  method get_transfer : int -> Raw.Component_transfer.t
  method as_component_transfer_node : Raw.Component_transfer_node.t
end

class component_transfer_node :
  Raw.Component_transfer_node.t ->
  component_transfer_node_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Component_transfer_node.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GskComponentTransferNode], give one already wrapped.
*)

val new_ :
  Render_node.render_node_t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  component_transfer_node_t
