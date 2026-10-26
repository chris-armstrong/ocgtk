class type memory_texture_t = object
  inherit Texture.texture_t
  method as_memory_texture : Raw.Memory_texture.t
end

class memory_texture : Raw.Memory_texture.t -> memory_texture_t

val new_ :
  int ->
  int ->
  Enums.memoryformat ->
  Glib_bytes.t ->
  Gsize.t ->
  memory_texture_t
