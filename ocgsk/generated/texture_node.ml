class type texture_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_texture : unit -> Ocgdk.Texture.texture_t
  (** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

  (** {2:conversions Conversions} *)

  method as_texture_node : Raw.Texture_node.t
end

(* High-level class for TextureNode *)
class texture_node (obj : Raw.Texture_node.t) : texture_node_t =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_texture : unit -> Ocgdk.Texture.texture_t =
      fun () -> new Ocgdk.Texture.texture (Raw.Texture_node.get_texture obj)

    method as_texture_node = obj
  end

let new_ (texture : Ocgdk.Texture.texture_t) (bounds : Ocgraphene.Rect.rect_t) :
    texture_node_t =
  let texture = texture#as_texture in
  let bounds = bounds#as_rect in
  let obj_ = Raw.Texture_node.new_ texture bounds in
  new texture_node obj_
