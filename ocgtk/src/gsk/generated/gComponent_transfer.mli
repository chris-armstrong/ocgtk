class type component_transfer_t = object
  method as_component_transfer : Component_transfer.t
end

class component_transfer : Component_transfer.t -> component_transfer_t

val new_discrete : int -> float array -> component_transfer_t
val new_gamma : float -> float -> float -> component_transfer_t
val new_identity : unit -> component_transfer_t
val new_levels : float -> component_transfer_t
val new_linear : float -> float -> component_transfer_t
val new_table : int -> float array -> component_transfer_t
