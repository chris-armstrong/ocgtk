class type border_node_t = object
  inherit Render_node.render_node_t
  method get_colors : unit -> Ocgdk.Raw.Rgb_a.t array
  method get_outline : unit -> Raw.Rounded_rect.t
  method get_widths : unit -> float array
  method as_border_node : Raw.Border_node.t
end

class border_node : Raw.Border_node.t -> border_node_t

val new_ :
  Raw.Rounded_rect.t -> float array -> Ocgdk.Raw.Rgb_a.t array -> border_node_t
