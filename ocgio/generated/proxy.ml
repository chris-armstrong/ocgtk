class type proxy_t = object
  (** {2:methods Methods} *)

  method connect :
    Io_stream.io_stream_t ->
    Proxy_address.proxy_address_t ->
    Cancellable.cancellable_t option ->
    (Io_stream.io_stream_t, GError.t) result
  (** Given [connection] to communicate with a proxy (eg, a [GSocketConnection]
      that is connected to the proxy server), this does the necessary handshake
      to connect to [proxy_address], and if required, wraps the [GIOStream] to
      handle proxy payload. *)

  method connect_finish :
    Async_result.async_result_t -> (Io_stream.io_stream_t, GError.t) result
  (** See g_proxy_connect(). *)

  method supports_hostname : unit -> bool
  (** Some proxy protocols expect to be passed a hostname, which they will
      resolve to an IP address themselves. Others, like SOCKS4, do not allow
      this. This function will return [FALSE] if [proxy] is implementing such a
      protocol. When [FALSE] is returned, the caller should resolve the
      destination hostname first, and then pass a [GProxyAddress] containing the
      stringified IP address to g_proxy_connect() or g_proxy_connect_async(). *)

  (** {2:conversions Conversions} *)

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
