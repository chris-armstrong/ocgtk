class type border_node_t = object
    inherit GRender_node.render_node_t
    method get_colors : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method get_outline : unit -> Rounded_rect.t
    method get_widths : unit -> float array
    method as_border_node : Border_node.t
end

class border_node : Border_node.t -> border_node_t

