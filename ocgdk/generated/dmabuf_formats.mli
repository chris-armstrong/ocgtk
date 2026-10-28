(** Provides information about supported DMA buffer formats.

    Its methods, signals and properties are on {!class-type-dmabuf_formats_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgdk.Raw.Dmabuf_formats}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DmabufFormats].}

    Provides information about supported DMA buffer formats.

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

    Note that DMA buffers only exist on Linux. *)
class type dmabuf_formats_t = object
  (** {2:methods Methods} *)

  method contains : UInt32.t -> UInt64.t -> bool
  (** Returns whether a given format is contained in [formats]. *)

  method equal : Raw.Dmabuf_formats.t option -> bool
  (** Returns whether [formats1] and [formats2] contain the same dmabuf formats,
      in the same order. *)

  method get_n_formats : unit -> Gsize.t
  (** Returns the number of formats that the [formats] object contains.

      Note that DMA buffers are a Linux concept, so on other platforms,
      [Gdk.DmabufFormats.get_n_formats] will always return zero. *)

  method ref : unit -> Raw.Dmabuf_formats.t
  (** Increases the reference count of [formats]. *)

  (** {2:conversions Conversions} *)

  method as_dmabuf_formats : Raw.Dmabuf_formats.t
end

class dmabuf_formats : Raw.Dmabuf_formats.t -> dmabuf_formats_t
(** Wraps a raw handle of {!Ocgdk.Raw.Dmabuf_formats.t}. *)

(** {1:description Description}

    Provides information about supported DMA buffer formats.

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

    Note that DMA buffers only exist on Linux. *)
