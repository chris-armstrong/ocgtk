class conic_gradient_node : Conic_gradient_node.t ->
  object
    method get_angle : unit -> float
    method get_rotation : unit -> float
    method as_conic_gradient_node : Conic_gradient_node.t
  end

