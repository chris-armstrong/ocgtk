class border_node : Border_node.t ->
  object
    method get_outline : unit -> Rounded_rect.t
    method get_widths : unit -> float array
    method as_border_node : Border_node.t
  end

