class type texture_scale_node_t = object
  inherit Render_node.render_node_t

  (** {2:methods Methods} *)

  method get_filter : unit -> Enums.scalingfilter
  (** Retrieves the [GskScalingFilter] used when creating this [GskRenderNode].
  *)

  method get_texture : unit -> Ocgdk.Texture.texture_t
  (** Retrieves the [GdkTexture] used when creating this [GskRenderNode]. *)

  (** {2:conversions Conversions} *)

  method as_texture_scale_node : Raw.Texture_scale_node.t
end

(* High-level class for TextureScaleNode *)
class texture_scale_node (obj : Raw.Texture_scale_node.t) : texture_scale_node_t
  =
  object (self)
    inherit Render_node.render_node (obj :> Raw.Render_node.t)

    method get_filter : unit -> Enums.scalingfilter =
      fun () -> Raw.Texture_scale_node.get_filter obj

    method get_texture : unit -> Ocgdk.Texture.texture_t =
      fun () ->
        new Ocgdk.Texture.texture (Raw.Texture_scale_node.get_texture obj)

    method as_texture_scale_node = obj
  end

let new_ (texture : Ocgdk.Texture.texture_t) (bounds : Ocgraphene.Rect.rect_t)
    (filter : Enums.scalingfilter) : texture_scale_node_t =
  let texture = texture#as_texture in
  let bounds = bounds#as_rect in
  let obj_ = Raw.Texture_scale_node.new_ texture bounds filter in
  new texture_scale_node obj_
