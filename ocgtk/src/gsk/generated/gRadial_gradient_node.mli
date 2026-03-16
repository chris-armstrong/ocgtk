class radial_gradient_node : Radial_gradient_node.t ->
  object
    method get_end : unit -> float
    method get_hradius : unit -> float
    method get_start : unit -> float
    method get_vradius : unit -> float
    method as_radial_gradient_node : Radial_gradient_node.t
  end

