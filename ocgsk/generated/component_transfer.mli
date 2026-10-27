(** Specifies a transfer function for a color component to be applied while
    rendering.

    The available functions include linear, piecewise-linear, gamma and step
    functions.

    Note that the transfer function is applied to un-premultiplied values, and
    all results are clamped to the \[0, 1\] range.

    Its methods, signals and properties are on
    {!class-type-component_transfer_t}. The functions it is built on are in
    {!Ocgsk.Raw.Component_transfer}. *)

(** The methods, signals and properties of a [GskComponentTransfer]. *)
class type component_transfer_t = object
  method as_component_transfer : Raw.Component_transfer.t
end

class component_transfer : Raw.Component_transfer.t -> component_transfer_t
(** Wraps a layer 1 handle, {!Ocgsk.Raw.Component_transfer.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GskComponentTransfer], give one already wrapped. *)

val new_discrete : int -> float array -> component_transfer_t
val new_gamma : float -> float -> float -> component_transfer_t
val new_identity : unit -> component_transfer_t
val new_levels : float -> component_transfer_t
val new_linear : float -> float -> component_transfer_t
val new_table : int -> float array -> component_transfer_t
