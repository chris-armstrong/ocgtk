class type texture_node_t = object
    inherit GRender_node.render_node_t
    method get_texture : unit -> Ocgtk_gdk.Gdk.texture_t
    method as_texture_node : Texture_node.t
end

(* High-level class for TextureNode *)
class texture_node (obj : Texture_node.t) : texture_node_t = object (self)
  inherit GRender_node.render_node (Obj.magic obj : Render_node.t)

  method get_texture : unit -> Ocgtk_gdk.Gdk.texture_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.texture(Texture_node.get_texture obj)

    method as_texture_node = obj
end

