class type inset_shadow_node_t = object
    inherit GRender_node.render_node_t
    method get_blur_radius : unit -> float
    method get_color : unit -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t
    method get_dx : unit -> float
    method get_dy : unit -> float
    method get_outline : unit -> Rounded_rect.t
    method get_spread : unit -> float
    method as_inset_shadow_node : Inset_shadow_node.t
end

class inset_shadow_node : Inset_shadow_node.t -> inset_shadow_node_t

val new_ : Rounded_rect.t -> Ocgtk_gdk.Gdk.Rgb_a.rgb_a_t -> float -> float -> float -> float -> inset_shadow_node_t
