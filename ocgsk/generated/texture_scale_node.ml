class type texture_scale_node_t = object
  inherit GRender_node.render_node_t
  method get_filter : unit -> Gsk_enums.scalingfilter
  method get_texture : unit -> Ocgtk_gdk.Gdk.Texture.texture_t
  method as_texture_scale_node : Texture_scale_node.t
end

(* High-level class for TextureScaleNode *)
class texture_scale_node (obj : Texture_scale_node.t) : texture_scale_node_t =
  object (self)
    inherit GRender_node.render_node (obj :> Render_node.t)

    method get_filter : unit -> Gsk_enums.scalingfilter =
      fun () -> Texture_scale_node.get_filter obj

    method get_texture : unit -> Ocgtk_gdk.Gdk.Texture.texture_t =
      fun () ->
        new Ocgtk_gdk.Gdk.Texture.texture (Texture_scale_node.get_texture obj)

    method as_texture_scale_node = obj
  end

let new_ (texture : Ocgtk_gdk.Gdk.Texture.texture_t)
    (bounds : Ocgtk_graphene.Graphene.Rect.rect_t)
    (filter : Gsk_enums.scalingfilter) : texture_scale_node_t =
  let texture = texture#as_texture in
  let bounds = bounds#as_rect in
  let obj_ = Texture_scale_node.new_ texture bounds filter in
  new texture_scale_node obj_
