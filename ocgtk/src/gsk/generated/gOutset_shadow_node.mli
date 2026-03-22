class type outset_shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_blur_radius : unit -> float
    method get_color : unit -> Ocgtk_gdk.Gdk.rgb_a_t
    method get_dx : unit -> float
    method get_dy : unit -> float
    method get_outline : unit -> Rounded_rect.t
    method get_spread : unit -> float
    method as_outset_shadow_node : Outset_shadow_node.t
end

class outset_shadow_node : Outset_shadow_node.t -> outset_shadow_node_t

