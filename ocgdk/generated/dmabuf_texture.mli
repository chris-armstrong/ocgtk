(** A [GdkTexture] representing a DMA buffer.

    Its methods, signals and properties are on {!class-type-dmabuf_texture_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgdk.Raw.Dmabuf_texture}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DmabufTexture].}

    A [GdkTexture] representing a DMA buffer.

    To create a [GdkDmabufTexture], use the auxiliary [Gdk.DmabufTextureBuilder]
    object.

    Dma-buf textures can only be created on Linux. *)
class type dmabuf_texture_t = object
  inherit Texture.texture_t

  (** {2:conversions Conversions} *)

  method as_dmabuf_texture : Raw.Dmabuf_texture.t
end

class dmabuf_texture : Raw.Dmabuf_texture.t -> dmabuf_texture_t
(** Wraps a raw handle of {!Ocgdk.Raw.Dmabuf_texture.t}. *)

(** {1:description Description}

    A [GdkTexture] representing a DMA buffer.

    To create a [GdkDmabufTexture], use the auxiliary [Gdk.DmabufTextureBuilder]
    object.

    Dma-buf textures can only be created on Linux. *)
