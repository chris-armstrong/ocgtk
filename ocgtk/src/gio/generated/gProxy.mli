class proxy : Proxy.t ->
  object
    method connect : #GIo_stream.io_stream -> #GProxy_address.proxy_address -> #GCancellable.cancellable option -> (GIo_stream.io_stream, GError.t) result
    method supports_hostname : unit -> bool
    method as_proxy : Proxy.t
  end

