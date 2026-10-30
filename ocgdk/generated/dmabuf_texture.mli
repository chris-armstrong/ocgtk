(** A [GdkTexture] representing a DMA buffer.

    Its methods, signals and properties are on {!class-type-dmabuf_texture_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Dmabuf_texture}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DmabufTexture].}

    Inherits from: {{!Ocgdk.Texture.class-type-texture_t}Ocgdk.Texture}

    Implements:
    - {{!Ocgdk.Paintable.class-type-paintable_t}Ocgdk.Paintable}
    - {{!Ocgio.Icon.class-type-icon_t}Ocgio.Icon}
    - {{!Ocgio.Loadable_icon.class-type-loadable_icon_t}Ocgio.Loadable_icon}

    A [GdkTexture] representing a DMA buffer.

    To create a [GdkDmabufTexture], use the auxiliary
    {{!Ocgdk.Dmabuf_texture_builder.class-type-dmabuf_texture_builder_t}[Gdk.DmabufTextureBuilder]}
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

    To create a [GdkDmabufTexture], use the auxiliary
    {{!Ocgdk.Dmabuf_texture_builder.class-type-dmabuf_texture_builder_t}[Gdk.DmabufTextureBuilder]}
    object.

    Dma-buf textures can only be created on Linux. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
