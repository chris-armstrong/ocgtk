(* High-level class for ProxyResolver *)
class proxy_resolver (obj : Proxy_resolver.t) = object (self)

  method is_supported : unit -> bool =
    fun () ->
      (Proxy_resolver.is_supported obj)

  method lookup : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (string array, GError.t) result =
    fun uri cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Proxy_resolver.lookup obj uri cancellable)

    method as_proxy_resolver = obj
end

