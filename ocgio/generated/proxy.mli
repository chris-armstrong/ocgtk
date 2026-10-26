class type proxy_t = object
  method connect :
    Io_stream.io_stream_t ->
    Proxy_address.proxy_address_t ->
    Cancellable.cancellable_t option ->
    (Io_stream.io_stream_t, GError.t) result

  method connect_finish :
    Async_result.async_result_t -> (Io_stream.io_stream_t, GError.t) result

  method supports_hostname : unit -> bool
  method as_proxy : Raw.Proxy.t
end

class proxy : Raw.Proxy.t -> proxy_t
