class dmabuf_formats : Dmabuf_formats.t ->
  object
    method equal : Dmabuf_formats.t option -> bool
    method ref : unit -> Dmabuf_formats.t
    method unref : unit -> unit
    method as_dmabuf_formats : Dmabuf_formats.t
  end

