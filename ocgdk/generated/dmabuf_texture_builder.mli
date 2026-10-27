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

    Its methods, signals and properties are on
    {!class-type-dmabuf_texture_builder_t}. The functions it is built on are in
    {!Ocgdk.Raw.Dmabuf_texture_builder}. *)

(** The methods, signals and properties of a [GdkDmabufTextureBuilder]. *)
class type dmabuf_texture_builder_t = object
  method get_color_state : unit -> Raw.Color_state.t option
  method get_display : unit -> App_launch_context_cycle_de440b34.display_t
  method get_fd : int -> int
  method get_fourcc : unit -> UInt32.t
  method get_height : unit -> int
  method get_modifier : unit -> UInt64.t
  method get_n_planes : unit -> int
  method get_offset : int -> int
  method get_premultiplied : unit -> bool
  method get_stride : int -> int
  method get_update_region : unit -> Occairo.Region.region_t option
  method get_update_texture : unit -> Texture.texture_t option
  method get_width : unit -> int
  method set_color_state : Raw.Color_state.t option -> unit
  method set_display : App_launch_context_cycle_de440b34.display_t -> unit
  method set_fd : int -> int -> unit
  method set_fourcc : UInt32.t -> unit
  method set_height : int -> unit
  method set_modifier : UInt64.t -> unit
  method set_n_planes : int -> unit
  method set_offset : int -> int -> unit
  method set_premultiplied : bool -> unit
  method set_stride : int -> int -> unit
  method set_update_region : Occairo.Region.region_t option -> unit
  method set_update_texture : Texture.texture_t option -> unit
  method set_width : int -> unit
  method as_dmabuf_texture_builder : Raw.Dmabuf_texture_builder.t
end

class dmabuf_texture_builder :
  Raw.Dmabuf_texture_builder.t ->
  dmabuf_texture_builder_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Dmabuf_texture_builder.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkDmabufTextureBuilder], give one already wrapped.
*)

val new_ : unit -> dmabuf_texture_builder_t
