class type dmabuf_formats_t = object
    method contains : int -> Unsigned.UInt64.t -> bool
    method equal : Dmabuf_formats.t option -> bool
    method get_n_formats : unit -> int
    method ref : unit -> Dmabuf_formats.t
    method unref : unit -> unit
    method as_dmabuf_formats : Dmabuf_formats.t
end

(* High-level class for DmabufFormats *)
class dmabuf_formats (obj : Dmabuf_formats.t) : dmabuf_formats_t = object (self)

  method contains : int -> Unsigned.UInt64.t -> bool =
    fun fourcc modifier ->
      (Dmabuf_formats.contains obj fourcc modifier)

  method equal : Dmabuf_formats.t option -> bool =
    fun formats2 ->
      (Dmabuf_formats.equal obj formats2)

  method get_n_formats : unit -> int =
    fun () ->
      (Dmabuf_formats.get_n_formats obj)

  method ref : unit -> Dmabuf_formats.t =
    fun () ->
      (Dmabuf_formats.ref obj)

  method unref : unit -> unit =
    fun () ->
      (Dmabuf_formats.unref obj)

    method as_dmabuf_formats = obj
end

