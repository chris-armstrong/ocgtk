class type texture_node_t = object
    inherit GRender_node.render_node_t
    method get_texture : unit -> Ocgtk_gdk.Gdk.Texture.texture_t
    method as_texture_node : Texture_node.t
end

(* High-level class for TextureNode *)
class texture_node (obj : Texture_node.t) : texture_node_t = object (self)
  inherit GRender_node.render_node (obj :> Render_node.t)

  method get_texture : unit -> Ocgtk_gdk.Gdk.Texture.texture_t =
    fun () ->
      new  Ocgtk_gdk.Gdk.Texture.texture(Texture_node.get_texture obj)

    method as_texture_node = obj
end

let new_ (texture : Ocgtk_gdk.Gdk.Texture.texture_t) (bounds : Ocgtk_graphene.Graphene.Rect.rect_t) : texture_node_t =
  let texture = texture#as_texture in
  let bounds = bounds#as_rect in
  let obj_ = Texture_node.new_ texture bounds in
  new texture_node obj_

