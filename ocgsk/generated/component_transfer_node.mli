(** Bindings for [ComponentTransferNode].

    Its methods, signals and properties are on
    {!class-type-component_transfer_node_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Component_transfer_node}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ComponentTransferNode].} *)
class type component_transfer_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_child : unit -> Render_node.render_node_t
  (** Gets the child node that is getting drawn by the given [node]. *)

  method get_transfer : int -> Raw.Component_transfer.t
  (** Gets the component transfer for one of the components. *)

  (** {2:conversions Conversions} *)

  method as_component_transfer_node : Raw.Component_transfer_node.t
end

class component_transfer_node :
  Raw.Component_transfer_node.t ->
  component_transfer_node_t
(** Wraps a raw handle of {!Ocgsk.Raw.Component_transfer_node.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Render_node.render_node_t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  Raw.Component_transfer.t ->
  component_transfer_node_t
(** Creates a render node that will apply component transfers to a child node.
*)
