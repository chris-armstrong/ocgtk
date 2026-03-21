class type proxy_t = object
    method connect : GIo_stream.io_stream_t -> GProxy_address.proxy_address_t -> GCancellable.cancellable_t option -> (GIo_stream.io_stream_t, GError.t) result
    method supports_hostname : unit -> bool
    method as_proxy : Proxy.t
end

(* High-level class for Proxy *)
class proxy (obj : Proxy.t) : proxy_t = object (self)

  method connect : GIo_stream.io_stream_t -> GProxy_address.proxy_address_t -> GCancellable.cancellable_t option -> (GIo_stream.io_stream_t, GError.t) result =
    fun connection proxy_address cancellable ->
      let connection = connection#as_io_stream in
      let proxy_address = proxy_address#as_proxy_address in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GIo_stream.io_stream ret)(Proxy.connect obj connection proxy_address cancellable)

  method supports_hostname : unit -> bool =
    fun () ->
      (Proxy.supports_hostname obj)

    method as_proxy = obj
end

