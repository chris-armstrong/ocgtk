class type texture_scale_node_t = object
    inherit GRender_node.render_node_t
    method get_filter : unit -> Gsk_enums.scalingfilter
    method get_texture : unit -> Ocgtk_gdk.Gdk.texture_t
    method as_texture_scale_node : Texture_scale_node.t
end

class texture_scale_node : Texture_scale_node.t -> texture_scale_node_t

