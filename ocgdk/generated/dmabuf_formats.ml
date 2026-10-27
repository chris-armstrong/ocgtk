class type dmabuf_formats_t = object
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

  method as_dmabuf_formats : Raw.Dmabuf_formats.t
end

(* High-level class for DmabufFormats *)
class dmabuf_formats (obj : Raw.Dmabuf_formats.t) : dmabuf_formats_t =
  object (self)
    method contains : UInt32.t -> UInt64.t -> bool =
      fun fourcc modifier -> Raw.Dmabuf_formats.contains obj fourcc modifier

    method equal : Raw.Dmabuf_formats.t option -> bool =
      fun formats2 -> Raw.Dmabuf_formats.equal obj formats2

    method get_n_formats : unit -> Gsize.t =
      fun () -> Raw.Dmabuf_formats.get_n_formats obj

    method ref : unit -> Raw.Dmabuf_formats.t =
      fun () -> Raw.Dmabuf_formats.ref obj

    method as_dmabuf_formats = obj
  end
