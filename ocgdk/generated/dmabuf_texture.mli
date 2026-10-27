(** A [GdkTexture] representing a DMA buffer.

    To create a [GdkDmabufTexture], use the auxiliary [Gdk.DmabufTextureBuilder]
    object.

    Dma-buf textures can only be created on Linux.

    Its methods, signals and properties are on {!class-type-dmabuf_texture_t}.
    The functions it is built on are in {!Ocgdk.Raw.Dmabuf_texture}. *)

(** The methods, signals and properties of a [GdkDmabufTexture]. *)
class type dmabuf_texture_t = object
  inherit Texture.texture_t
  method as_dmabuf_texture : Raw.Dmabuf_texture.t
end

class dmabuf_texture : Raw.Dmabuf_texture.t -> dmabuf_texture_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Dmabuf_texture.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkDmabufTexture], give one already wrapped. *)
