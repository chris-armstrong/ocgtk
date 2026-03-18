class texture_node : Texture_node.t ->
  object
    method get_texture : unit -> Ocgtk_gdk.Gdk.texture
    method as_texture_node : Texture_node.t
  end

