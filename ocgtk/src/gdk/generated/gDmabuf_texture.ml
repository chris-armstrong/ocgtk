class type dmabuf_texture_t = object
    method as_dmabuf_texture : Dmabuf_texture.t
end

(* High-level class for DmabufTexture *)
class dmabuf_texture (obj : Dmabuf_texture.t) : dmabuf_texture_t = object (self)

    method as_dmabuf_texture = obj
end

