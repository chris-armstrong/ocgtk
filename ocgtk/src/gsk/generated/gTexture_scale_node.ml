class type texture_scale_node_t = object
    method get_filter : unit -> Gsk_enums.scalingfilter
    method get_texture : unit -> Ocgtk_gdk.Gdk.texture_t
    method as_texture_scale_node : Texture_scale_node.t
end

(* High-level class for TextureScaleNode *)
class texture_scale_node (obj : Texture_scale_node.t) : texture_scale_node_t = object (self)

  method get_filter : unit -> Gsk_enums.scalingfilter =
    fun () ->
      (Texture_scale_node.get_filter obj)

  method get_texture : unit -> Ocgtk_gdk.Gdk.texture_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.texture(Texture_scale_node.get_texture obj)

    method as_texture_scale_node = obj
end

