class type memory_texture_t = object
    inherit GTexture.texture_t
    method as_memory_texture : Memory_texture.t
end

(* High-level class for MemoryTexture *)
class memory_texture (obj : Memory_texture.t) : memory_texture_t = object (self)
  inherit GTexture.texture (obj :> Texture.t)

    method as_memory_texture = obj
end

let new_ (width : int) (height : int) (format : Gdk_enums.memoryformat) (bytes : Glib_bytes.t) (stride : Gsize.t) : memory_texture_t =
  let obj_ = Memory_texture.new_ width height format bytes stride in
  new memory_texture obj_

