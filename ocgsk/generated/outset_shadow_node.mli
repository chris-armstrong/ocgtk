class type outset_shadow_node_t = object
  inherit Render_node.render_node_t
  method get_blur_radius : unit -> float
  method get_color : unit -> Ocgdk.Rgb_a.rgb_a_t
  method get_dx : unit -> float
  method get_dy : unit -> float
  method get_outline : unit -> Raw.Rounded_rect.t
  method get_spread : unit -> float
  method as_outset_shadow_node : Raw.Outset_shadow_node.t
end

class outset_shadow_node : Raw.Outset_shadow_node.t -> outset_shadow_node_t

val new_ :
  Raw.Rounded_rect.t ->
  Ocgdk.Rgb_a.rgb_a_t ->
  float ->
  float ->
  float ->
  float ->
  outset_shadow_node_t
