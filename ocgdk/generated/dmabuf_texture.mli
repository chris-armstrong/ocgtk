class type dmabuf_texture_t = object
  inherit Texture.texture_t
  method as_dmabuf_texture : Raw.Dmabuf_texture.t
end

class dmabuf_texture : Raw.Dmabuf_texture.t -> dmabuf_texture_t
