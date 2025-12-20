(* High-level class for ProxyResolver *)
class proxy_resolver (obj : Proxy_resolver.t) = object (self)

  method is_supported : unit -> bool =
    fun () ->
      (Proxy_resolver.is_supported obj)

    method as_proxy_resolver = obj
end

