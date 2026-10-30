(** A [GdkTexture] representing image data in memory.

    Its methods, signals and properties are on {!class-type-memory_texture_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgdk.Raw.Memory_texture}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MemoryTexture].}

    Inherits from: {{!Ocgdk.Texture.class-type-texture_t}Ocgdk.Texture}

    Implements:
    - {{!Ocgdk.Paintable.class-type-paintable_t}Ocgdk.Paintable}
    - {{!Ocgio.Icon.class-type-icon_t}Ocgio.Icon}
    - {{!Ocgio.Loadable_icon.class-type-loadable_icon_t}Ocgio.Loadable_icon}

    A [GdkTexture] representing image data in memory. *)
class type memory_texture_t = object
  inherit Texture.texture_t

  (** {2:conversions Conversions} *)

  method as_memory_texture : Raw.Memory_texture.t
end

class memory_texture : Raw.Memory_texture.t -> memory_texture_t
(** Wraps a raw handle of {!Ocgdk.Raw.Memory_texture.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  int ->
  int ->
  Enums.memoryformat ->
  Glib_bytes.t ->
  Gsize.t ->
  memory_texture_t
(** Creates a new texture for a blob of image data.

    The [GBytes] must contain [stride] × [height] pixels in the given format. *)
