class texture_scale_node : Texture_scale_node.t ->
  object
    method get_filter : unit -> Gsk_enums.scalingfilter
    method get_texture : unit -> Ocgtk_gdk.Gdk.texture
    method as_texture_scale_node : Texture_scale_node.t
  end

