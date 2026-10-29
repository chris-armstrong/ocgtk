(** Constructs {{!Ocgdk.Texture.class-type-texture_t}[Gdk.Texture]} objects from
    DMA buffers.

    Its methods, signals and properties are on
    {!class-type-dmabuf_texture_builder_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgdk.Raw.Dmabuf_texture_builder}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DmabufTextureBuilder].}

    Constructs {{!Ocgdk.Texture.class-type-texture_t}[Gdk.Texture]} objects from
    DMA buffers.

    DMA buffers are commonly called {b _dma-bufs_}.

    DMA buffers are a feature of the Linux kernel to enable efficient buffer and
    memory sharing between hardware such as codecs, GPUs, displays, cameras and
    the kernel drivers controlling them. For example, a decoder may want its
    output to be directly shared with the display server for rendering without a
    copy.

    Any device driver which participates in DMA buffer sharing, can do so as
    either the exporter or importer of buffers (or both).

    The memory that is shared via DMA buffers is usually stored in non-system
    memory (maybe in device's local memory or something else not directly
    accessible by the CPU), and accessing this memory from the CPU may have
    higher-than-usual overhead.

    In particular for graphics data, it is not uncommon that data consists of
    multiple separate blocks of memory, for example one block for each of the
    red, green and blue channels. These blocks are called {b _planes_}. DMA
    buffers can have up to four planes. Even if the memory is a single block,
    the data can be organized in multiple planes, by specifying offsets from the
    beginning of the data.

    DMA buffers are exposed to user-space as file descriptors allowing to pass
    them between processes. If a DMA buffer has multiple planes, there is one
    file descriptor per plane.

    The format of the data (for graphics data, essentially its colorspace) is
    described by a 32-bit integer. These format identifiers are defined in the
    header file [drm_fourcc.h] and commonly referred to as {b _fourcc_} values,
    since they are identified by 4 ASCII characters. Additionally, each DMA
    buffer has a {b _modifier_}, which is a 64-bit integer that describes
    driver-specific details of the memory layout, such as tiling or compression.

    For historical reasons, some producers of dma-bufs don't provide an explicit
    modifier, but instead return [DMA_FORMAT_MOD_INVALID] to indicate that their
    modifier is {b _implicit_}. GTK tries to accommodate this situation by
    accepting [DMA_FORMAT_MOD_INVALID] as modifier.

    The operation of [GdkDmabufTextureBuilder] is quite simple: Create a texture
    builder, set all the necessary properties, and then call
    [Gdk.DmabufTextureBuilder.build] to create the new texture.

    The required properties for a dma-buf texture are

    - The width and height in pixels

    - The [fourcc] code and [modifier] which identify the format and memory
      layout of the dma-buf

    - The file descriptor, offset and stride for each of the planes

    [GdkDmabufTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.

    For further information, see

    - The Linux kernel
      {{:https://docs.kernel.org/driver-api/dma-buf.html}documentation}

    - The header file
      {{:https://gitlab.freedesktop.org/mesa/drm/-/blob/main/include/drm/drm_fourcc.h}drm_fourcc.h}
*)
class type dmabuf_texture_builder_t = object
  (** {2:methods Methods} *)

  method get_color_state : unit -> Raw.Color_state.t option
  (** Gets the color state previously set via
      gdk_dmabuf_texture_builder_set_color_state(). *)

  method get_display : unit -> Display.display_t
  (** Returns the display that this texture builder is associated with. *)

  method get_fd : int -> int
  (** Gets the file descriptor for a plane. *)

  method get_fourcc : unit -> UInt32.t
  (** Gets the format previously set via gdk_dmabuf_texture_builder_set_fourcc()
      or 0 if the format wasn't set.

      The format is specified as a fourcc code. *)

  method get_height : unit -> int
  (** Gets the height previously set via gdk_dmabuf_texture_builder_set_height()
      or 0 if the height wasn't set. *)

  method get_modifier : unit -> UInt64.t
  (** Gets the modifier value. *)

  method get_n_planes : unit -> int
  (** Gets the number of planes. *)

  method get_offset : int -> int
  (** Gets the offset value for a plane. *)

  method get_premultiplied : unit -> bool
  (** Whether the data is premultiplied. *)

  method get_stride : int -> int
  (** Gets the stride value for a plane. *)

  method get_update_region : unit -> Occairo.Region.region_t option
  (** Gets the region previously set via
      gdk_dmabuf_texture_builder_set_update_region() or [None] if none was set.
  *)

  method get_update_texture : unit -> Texture.texture_t option
  (** Gets the texture previously set via
      gdk_dmabuf_texture_builder_set_update_texture() or [None] if none was set.
  *)

  method get_width : unit -> int
  (** Gets the width previously set via gdk_dmabuf_texture_builder_set_width()
      or 0 if the width wasn't set. *)

  method set_color_state : Raw.Color_state.t option -> unit
  (** Sets the color state for the texture.

      By default, the colorstate is [None]. In that case, GTK will choose the
      correct colorstate based on the format. If you don't know what colorstates
      are, this is probably the right thing. *)

  method set_display : Display.display_t -> unit
  (** Sets the display that this texture builder is associated with.

      The display is used to determine the supported dma-buf formats. *)

  method set_fd : int -> int -> unit
  (** Sets the file descriptor for a plane. *)

  method set_fourcc : UInt32.t -> unit
  (** Sets the format of the texture.

      The format is specified as a fourcc code.

      The format must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

  method set_height : int -> unit
  (** Sets the height of the texture.

      The height must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

  method set_modifier : UInt64.t -> unit
  (** Sets the modifier. *)

  method set_n_planes : int -> unit
  (** Sets the number of planes of the texture. *)

  method set_offset : int -> int -> unit
  (** Sets the offset for a plane. *)

  method set_premultiplied : bool -> unit
  (** Sets whether the data is premultiplied.

      Unless otherwise specified, all formats including alpha channels are
      assumed to be premultiplied. *)

  method set_stride : int -> int -> unit
  (** Sets the stride for a plane.

      The stride must be set for all planes before calling
      [Gdk.DmabufTextureBuilder.build]. *)

  method set_update_region : Occairo.Region.region_t option -> unit
  (** Sets the region to be updated by this texture. Together with
      [Gdk.DmabufTextureBuilder:update-texture] this describes an update of a
      previous texture.

      When rendering animations of large textures, it is possible that
      consecutive textures are only updating contents in parts of the texture.
      It is then possible to describe this update via these two properties, so
      that GTK can avoid rerendering parts that did not change.

      An example would be a screen recording where only the mouse pointer moves.
  *)

  method set_update_texture : Texture.texture_t option -> unit
  (** Sets the texture to be updated by this texture. See
      [Gdk.DmabufTextureBuilder.set_update_region] for an explanation. *)

  method set_width : int -> unit
  (** Sets the width of the texture.

      The width must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

  (** {2:conversions Conversions} *)

  method as_dmabuf_texture_builder : Raw.Dmabuf_texture_builder.t
end

class dmabuf_texture_builder :
  Raw.Dmabuf_texture_builder.t ->
  dmabuf_texture_builder_t
(** Wraps a raw handle of {!Ocgdk.Raw.Dmabuf_texture_builder.t}. *)

(** {1:description Description}

    Constructs {{!Ocgdk.Texture.class-type-texture_t}[Gdk.Texture]} objects from
    DMA buffers.

    DMA buffers are commonly called {b _dma-bufs_}.

    DMA buffers are a feature of the Linux kernel to enable efficient buffer and
    memory sharing between hardware such as codecs, GPUs, displays, cameras and
    the kernel drivers controlling them. For example, a decoder may want its
    output to be directly shared with the display server for rendering without a
    copy.

    Any device driver which participates in DMA buffer sharing, can do so as
    either the exporter or importer of buffers (or both).

    The memory that is shared via DMA buffers is usually stored in non-system
    memory (maybe in device's local memory or something else not directly
    accessible by the CPU), and accessing this memory from the CPU may have
    higher-than-usual overhead.

    In particular for graphics data, it is not uncommon that data consists of
    multiple separate blocks of memory, for example one block for each of the
    red, green and blue channels. These blocks are called {b _planes_}. DMA
    buffers can have up to four planes. Even if the memory is a single block,
    the data can be organized in multiple planes, by specifying offsets from the
    beginning of the data.

    DMA buffers are exposed to user-space as file descriptors allowing to pass
    them between processes. If a DMA buffer has multiple planes, there is one
    file descriptor per plane.

    The format of the data (for graphics data, essentially its colorspace) is
    described by a 32-bit integer. These format identifiers are defined in the
    header file [drm_fourcc.h] and commonly referred to as {b _fourcc_} values,
    since they are identified by 4 ASCII characters. Additionally, each DMA
    buffer has a {b _modifier_}, which is a 64-bit integer that describes
    driver-specific details of the memory layout, such as tiling or compression.

    For historical reasons, some producers of dma-bufs don't provide an explicit
    modifier, but instead return [DMA_FORMAT_MOD_INVALID] to indicate that their
    modifier is {b _implicit_}. GTK tries to accommodate this situation by
    accepting [DMA_FORMAT_MOD_INVALID] as modifier.

    The operation of [GdkDmabufTextureBuilder] is quite simple: Create a texture
    builder, set all the necessary properties, and then call
    [Gdk.DmabufTextureBuilder.build] to create the new texture.

    The required properties for a dma-buf texture are

    - The width and height in pixels

    - The [fourcc] code and [modifier] which identify the format and memory
      layout of the dma-buf

    - The file descriptor, offset and stride for each of the planes

    [GdkDmabufTextureBuilder] can be used for quick one-shot construction of
    textures as well as kept around and reused to construct multiple textures.

    For further information, see

    - The Linux kernel
      {{:https://docs.kernel.org/driver-api/dma-buf.html}documentation}

    - The header file
      {{:https://gitlab.freedesktop.org/mesa/drm/-/blob/main/include/drm/drm_fourcc.h}drm_fourcc.h}
*)

(** {1:constructors Constructors} *)

val new_ : unit -> dmabuf_texture_builder_t
(** Creates a new texture builder. *)
