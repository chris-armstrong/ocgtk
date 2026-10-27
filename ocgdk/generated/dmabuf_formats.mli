(** Provides information about supported DMA buffer formats.

    You can query whether a given format is supported with
    [Gdk.DmabufFormats.contains] and you can iterate over the list of all
    supported formats with [Gdk.DmabufFormats.get_n_formats] and
    [Gdk.DmabufFormats.get_format].

    The list of supported formats is sorted by preference, with the best formats
    coming first.

    The list may contains (format, modifier) pairs where the modifier is
    [DMA_FORMAT_MOD_INVALID], indicating that {b _implicit modifiers_} may be
    used with this format.

    See [Gdk.DmabufTextureBuilder] for more information about DMA buffers.

    Note that DMA buffers only exist on Linux.

    Its methods, signals and properties are on {!class-type-dmabuf_formats_t}.
    The functions it is built on are in {!Ocgdk.Raw.Dmabuf_formats}. *)

(** The methods, signals and properties of a [GdkDmabufFormats]. *)
class type dmabuf_formats_t = object
  method contains : UInt32.t -> UInt64.t -> bool
  method equal : Raw.Dmabuf_formats.t option -> bool
  method get_n_formats : unit -> Gsize.t
  method ref : unit -> Raw.Dmabuf_formats.t
  method as_dmabuf_formats : Raw.Dmabuf_formats.t
end

class dmabuf_formats : Raw.Dmabuf_formats.t -> dmabuf_formats_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Dmabuf_formats.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkDmabufFormats], give one already wrapped. *)
