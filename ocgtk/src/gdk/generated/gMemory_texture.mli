class type memory_texture_t = object
    method as_memory_texture : Memory_texture.t
end

class memory_texture : Memory_texture.t -> memory_texture_t

