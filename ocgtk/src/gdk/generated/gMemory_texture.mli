class type memory_texture_t = object
  inherit GTexture.texture_t
  method as_memory_texture : Memory_texture.t
end

class memory_texture : Memory_texture.t -> memory_texture_t

val new_ :
  int ->
  int ->
  Gdk_enums.memoryformat ->
  Glib_bytes.t ->
  Gsize.t ->
  memory_texture_t
