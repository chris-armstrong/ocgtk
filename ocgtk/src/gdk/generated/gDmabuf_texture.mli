class type dmabuf_texture_t = object
    method as_dmabuf_texture : Dmabuf_texture.t
end

class dmabuf_texture : Dmabuf_texture.t -> dmabuf_texture_t

