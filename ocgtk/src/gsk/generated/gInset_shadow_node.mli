class inset_shadow_node : Inset_shadow_node.t ->
  object
    method get_blur_radius : unit -> float
    method get_dx : unit -> float
    method get_dy : unit -> float
    method get_outline : unit -> Rounded_rect.t
    method get_spread : unit -> float
    method as_inset_shadow_node : Inset_shadow_node.t
  end

