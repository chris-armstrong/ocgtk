class type dmabuf_formats_t = object
  method contains : UInt32.t -> UInt64.t -> bool
  method equal : Raw.Dmabuf_formats.t option -> bool
  method get_n_formats : unit -> Gsize.t
  method ref : unit -> Raw.Dmabuf_formats.t
  method as_dmabuf_formats : Raw.Dmabuf_formats.t
end

class dmabuf_formats : Raw.Dmabuf_formats.t -> dmabuf_formats_t
