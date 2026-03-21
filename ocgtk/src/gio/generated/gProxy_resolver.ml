class type proxy_resolver_t = object
    method is_supported : unit -> bool
    method lookup : string -> GCancellable.cancellable_t option -> (string array, GError.t) result
    method as_proxy_resolver : Proxy_resolver.t
end

(* High-level class for ProxyResolver *)
class proxy_resolver (obj : Proxy_resolver.t) : proxy_resolver_t = object (self)

  method is_supported : unit -> bool =
    fun () ->
      (Proxy_resolver.is_supported obj)

  method lookup : string -> GCancellable.cancellable_t option -> (string array, GError.t) result =
    fun uri cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Proxy_resolver.lookup obj uri cancellable)

    method as_proxy_resolver = obj
end

