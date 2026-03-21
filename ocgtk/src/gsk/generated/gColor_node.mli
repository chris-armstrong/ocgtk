class type color_node_t = object
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method as_color_node : Color_node.t
end

class color_node : Color_node.t -> color_node_t

