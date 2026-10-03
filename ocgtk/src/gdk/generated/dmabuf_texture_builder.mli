(* GENERATED CODE - DO NOT EDIT *)
(* DmabufTextureBuilder: DmabufTextureBuilder *)

type t = [ `dmabuf_texture_builder | `object_ ] Gobject.obj
(** Constructs [Gdk.Texture] objects from DMA buffers.

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

external new_ : unit -> t = "ml_gdk_dmabuf_texture_builder_new"
(** Create a new DmabufTextureBuilder *)

(* Methods *)

external set_width : t -> int -> unit
  = "ml_gdk_dmabuf_texture_builder_set_width"
(** Sets the width of the texture.

    The width must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

external set_update_texture : t -> Texture.t option -> unit
  = "ml_gdk_dmabuf_texture_builder_set_update_texture"
(** Sets the texture to be updated by this texture. See
    [Gdk.DmabufTextureBuilder.set_update_region] for an explanation. *)

external set_update_region :
  t -> Ocgtk_cairo.Cairo.Wrappers.Region.t option -> unit
  = "ml_gdk_dmabuf_texture_builder_set_update_region"
(** Sets the region to be updated by this texture. Together with
    [Gdk.DmabufTextureBuilder:update-texture] this describes an update of a
    previous texture.

    When rendering animations of large textures, it is possible that consecutive
    textures are only updating contents in parts of the texture. It is then
    possible to describe this update via these two properties, so that GTK can
    avoid rerendering parts that did not change.

    An example would be a screen recording where only the mouse pointer moves.
*)

external set_stride : t -> int -> int -> unit
  = "ml_gdk_dmabuf_texture_builder_set_stride"
(** Sets the stride for a plane.

    The stride must be set for all planes before calling
    [Gdk.DmabufTextureBuilder.build]. *)

external set_premultiplied : t -> bool -> unit
  = "ml_gdk_dmabuf_texture_builder_set_premultiplied"
(** Sets whether the data is premultiplied.

    Unless otherwise specified, all formats including alpha channels are assumed
    to be premultiplied. *)

external set_offset : t -> int -> int -> unit
  = "ml_gdk_dmabuf_texture_builder_set_offset"
(** Sets the offset for a plane. *)

external set_n_planes : t -> int -> unit
  = "ml_gdk_dmabuf_texture_builder_set_n_planes"
(** Sets the number of planes of the texture. *)

external set_modifier : t -> UInt64.t -> unit
  = "ml_gdk_dmabuf_texture_builder_set_modifier"
(** Sets the modifier. *)

external set_height : t -> int -> unit
  = "ml_gdk_dmabuf_texture_builder_set_height"
(** Sets the height of the texture.

    The height must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

external set_fourcc : t -> UInt32.t -> unit
  = "ml_gdk_dmabuf_texture_builder_set_fourcc"
(** Sets the format of the texture.

    The format is specified as a fourcc code.

    The format must be set before calling [Gdk.DmabufTextureBuilder.build]. *)

external set_fd : t -> int -> int -> unit
  = "ml_gdk_dmabuf_texture_builder_set_fd"
(** Sets the file descriptor for a plane. *)

external set_display : t -> App_launch_context_cycle_de440b34.Display.t -> unit
  = "ml_gdk_dmabuf_texture_builder_set_display"
(** Sets the display that this texture builder is associated with.

    The display is used to determine the supported dma-buf formats. *)

external set_color_state :
  t -> Cicp_params_and__color_state.Color_state.t option -> unit
  = "ml_gdk_dmabuf_texture_builder_set_color_state"
(** Sets the color state for the texture.

    By default, the colorstate is [NULL]. In that case, GTK will choose the
    correct colorstate based on the format. If you don't know what colorstates
    are, this is probably the right thing. *)

external get_width : t -> int = "ml_gdk_dmabuf_texture_builder_get_width"
(** Gets the width previously set via gdk_dmabuf_texture_builder_set_width() or
    0 if the width wasn't set. *)

external get_update_texture : t -> Texture.t option
  = "ml_gdk_dmabuf_texture_builder_get_update_texture"
(** Gets the texture previously set via
    gdk_dmabuf_texture_builder_set_update_texture() or [NULL] if none was set.
*)

external get_update_region : t -> Ocgtk_cairo.Cairo.Wrappers.Region.t option
  = "ml_gdk_dmabuf_texture_builder_get_update_region"
(** Gets the region previously set via
    gdk_dmabuf_texture_builder_set_update_region() or [NULL] if none was set. *)

external get_stride : t -> int -> int
  = "ml_gdk_dmabuf_texture_builder_get_stride"
(** Gets the stride value for a plane. *)

external get_premultiplied : t -> bool
  = "ml_gdk_dmabuf_texture_builder_get_premultiplied"
(** Whether the data is premultiplied. *)

external get_offset : t -> int -> int
  = "ml_gdk_dmabuf_texture_builder_get_offset"
(** Gets the offset value for a plane. *)

external get_n_planes : t -> int = "ml_gdk_dmabuf_texture_builder_get_n_planes"
(** Gets the number of planes. *)

external get_modifier : t -> UInt64.t
  = "ml_gdk_dmabuf_texture_builder_get_modifier"
(** Gets the modifier value. *)

external get_height : t -> int = "ml_gdk_dmabuf_texture_builder_get_height"
(** Gets the height previously set via gdk_dmabuf_texture_builder_set_height()
    or 0 if the height wasn't set. *)

external get_fourcc : t -> UInt32.t = "ml_gdk_dmabuf_texture_builder_get_fourcc"
(** Gets the format previously set via gdk_dmabuf_texture_builder_set_fourcc()
    or 0 if the format wasn't set.

    The format is specified as a fourcc code. *)

external get_fd : t -> int -> int = "ml_gdk_dmabuf_texture_builder_get_fd"
(** Gets the file descriptor for a plane. *)

external get_display : t -> App_launch_context_cycle_de440b34.Display.t
  = "ml_gdk_dmabuf_texture_builder_get_display"
(** Returns the display that this texture builder is associated with. *)

external get_color_state :
  t -> Cicp_params_and__color_state.Color_state.t option
  = "ml_gdk_dmabuf_texture_builder_get_color_state"
(** Gets the color state previously set via
    gdk_dmabuf_texture_builder_set_color_state(). *)

(* Properties *)
