(* High-level class for Proxy *)
class proxy (obj : Proxy.t) = object (self)

  method connect : 'p1 'p2 'p3. (#GIo_stream.io_stream as 'p1) -> (#GProxy_address.proxy_address as 'p2) -> (#GCancellable.cancellable as 'p3) option -> (GIo_stream.io_stream, GError.t) result =
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

