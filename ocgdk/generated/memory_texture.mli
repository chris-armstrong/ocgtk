(** A [GdkTexture] representing image data in memory.

    Its methods, signals and properties are on {!class-type-memory_texture_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgdk.Raw.Memory_texture}. *)

(** The methods, signals and properties of a [GdkMemoryTexture]. *)
class type memory_texture_t = object
  inherit Texture.texture_t
  method as_memory_texture : Raw.Memory_texture.t
end

class memory_texture : Raw.Memory_texture.t -> memory_texture_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Memory_texture.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkMemoryTexture], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  int ->
  int ->
  Enums.memoryformat ->
  Glib_bytes.t ->
  Gsize.t ->
  memory_texture_t
(** Creates a new texture for a blob of image data.

    The [GBytes] must contain [stride] × [height] pixels in the given format. *)
