class outset_shadow_node : Outset_shadow_node.t ->
  object
    method get_blur_radius : unit -> float
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a
    method get_dx : unit -> float
    method get_dy : unit -> float
    method get_outline : unit -> Rounded_rect.t
    method get_spread : unit -> float
    method as_outset_shadow_node : Outset_shadow_node.t
  end

