class type memory_texture_t = object
    inherit GTexture.texture_t
    method as_memory_texture : Memory_texture.t
end

(* High-level class for MemoryTexture *)
class memory_texture (obj : Memory_texture.t) : memory_texture_t = object (self)
  inherit GTexture.texture (obj :> Texture.t)

    method as_memory_texture = obj
end

