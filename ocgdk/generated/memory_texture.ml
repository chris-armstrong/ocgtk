class type memory_texture_t = object
  inherit Texture.texture_t

  (** {2:conversions Conversions} *)

  method as_memory_texture : Raw.Memory_texture.t
end

(* High-level class for MemoryTexture *)
class memory_texture (obj : Raw.Memory_texture.t) : memory_texture_t =
  object (self)
    inherit Texture.texture (obj :> Raw.Texture.t)
    method as_memory_texture = obj
  end

let new_ (width : int) (height : int) (format : Enums.memoryformat)
    (bytes : Glib_bytes.t) (stride : Gsize.t) : memory_texture_t =
  let obj_ = Raw.Memory_texture.new_ width height format bytes stride in
  new memory_texture obj_
