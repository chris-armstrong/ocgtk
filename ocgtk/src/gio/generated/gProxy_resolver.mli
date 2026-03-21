class type proxy_resolver_t = object
    method is_supported : unit -> bool
    method lookup : string -> GCancellable.cancellable_t option -> (string array, GError.t) result
    method as_proxy_resolver : Proxy_resolver.t
end

class proxy_resolver : Proxy_resolver.t -> proxy_resolver_t

