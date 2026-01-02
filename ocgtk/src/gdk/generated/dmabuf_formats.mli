(* GENERATED CODE - DO NOT EDIT *)
(* DmabufFormats: DmabufFormats *)

(** The `GdkDmabufFormats` struct provides information about
supported DMA buffer formats.

You can query whether a given format is supported with
[method@Gdk.DmabufFormats.contains] and you can iterate
over the list of all supported formats with
[method@Gdk.DmabufFormats.get_n_formats] and
[method@Gdk.DmabufFormats.get_format].

The list of supported formats is sorted by preference,
with the best formats coming first.

The list may contains (format, modifier) pairs where the modifier
is `DMA_FORMAT_MOD_INVALID`, indicating that **_implicit modifiers_**
may be used with this format.

See [class@Gdk.DmabufTextureBuilder] for more information
about DMA buffers.

Note that DMA buffers only exist on Linux. *)
type t = [`dmabuf_formats] Gobject.obj

(* Methods *)
(** Decreases the reference count of @formats.

When the reference count reaches zero,
the object is freed. *)
external unref : t -> unit = "ml_gdk_dmabuf_formats_unref"

(** Increases the reference count of @formats. *)
external ref : t -> t = "ml_gdk_dmabuf_formats_ref"

(** Returns whether @formats1 and @formats2 contain the
same dmabuf formats, in the same order. *)
external equal : t -> t option -> bool = "ml_gdk_dmabuf_formats_equal"

