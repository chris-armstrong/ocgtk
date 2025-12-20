class proxy_resolver : Proxy_resolver.t ->
  object
    method is_supported : unit -> bool
    method as_proxy_resolver : Proxy_resolver.t
  end

