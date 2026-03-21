class type proxy_t = object
    method connect : GIo_stream.io_stream_t -> GProxy_address.proxy_address_t -> GCancellable.cancellable_t option -> (GIo_stream.io_stream_t, GError.t) result
    method supports_hostname : unit -> bool
    method as_proxy : Proxy.t
end

class proxy : Proxy.t -> proxy_t

