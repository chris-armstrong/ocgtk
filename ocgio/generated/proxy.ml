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

(* High-level class for Proxy *)
class proxy (obj : Raw.Proxy.t) : proxy_t =
  object (self)
    method connect :
        Io_stream.io_stream_t ->
        Proxy_address.proxy_address_t ->
        Cancellable.cancellable_t option ->
        (Io_stream.io_stream_t, GError.t) result =
      fun connection proxy_address cancellable ->
        let connection = connection#as_io_stream in
        let proxy_address = proxy_address#as_proxy_address in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Io_stream.io_stream ret)
          (Raw.Proxy.connect obj connection proxy_address cancellable)

    method connect_finish :
        Async_result.async_result_t -> (Io_stream.io_stream_t, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Io_stream.io_stream ret)
          (Raw.Proxy.connect_finish obj result)

    method supports_hostname : unit -> bool =
      fun () -> Raw.Proxy.supports_hostname obj

    method as_proxy = obj
  end
