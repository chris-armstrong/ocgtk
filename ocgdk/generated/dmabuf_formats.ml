class type dmabuf_formats_t = object
  method contains : UInt32.t -> UInt64.t -> bool
  method equal : Raw.Dmabuf_formats.t option -> bool
  method get_n_formats : unit -> Gsize.t
  method ref : unit -> Raw.Dmabuf_formats.t
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
