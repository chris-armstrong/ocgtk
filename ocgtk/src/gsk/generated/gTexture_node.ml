(* High-level class for TextureNode *)
class texture_node (obj : Texture_node.t) = object (self)

  method get_texture : unit -> Ocgtk_gdk.Gdk.texture =
    fun () ->
      new  Ocgtk_gdk.Gdk.texture(Texture_node.get_texture obj)

    method as_texture_node = obj
end

