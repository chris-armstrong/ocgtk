class type dmabuf_formats_t = object
    method equal : Dmabuf_formats.t option -> bool
    method ref : unit -> Dmabuf_formats.t
    method unref : unit -> unit
    method as_dmabuf_formats : Dmabuf_formats.t
end

class dmabuf_formats : Dmabuf_formats.t -> dmabuf_formats_t

