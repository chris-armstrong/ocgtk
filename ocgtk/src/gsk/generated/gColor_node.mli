class color_node : Color_node.t ->
  object
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a
    method as_color_node : Color_node.t
  end

