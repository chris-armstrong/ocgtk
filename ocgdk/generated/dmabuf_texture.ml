class type dmabuf_texture_t = object
  inherit Texture.texture_t

  (** {2:conversions Conversions} *)

  method as_dmabuf_texture : Raw.Dmabuf_texture.t
end

(* High-level class for DmabufTexture *)
class dmabuf_texture (obj : Raw.Dmabuf_texture.t) : dmabuf_texture_t =
  object (self)
    inherit Texture.texture (obj :> Raw.Texture.t)
    method as_dmabuf_texture = obj
  end
