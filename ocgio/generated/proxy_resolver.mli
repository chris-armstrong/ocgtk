class type proxy_resolver_t = object
  method is_supported : unit -> bool

  method lookup :
    string ->
    Cancellable.cancellable_t option ->
    (string array, GError.t) result

  method lookup_finish :
    Async_result.async_result_t -> (string array, GError.t) result

  method as_proxy_resolver : Raw.Proxy_resolver.t
end

class proxy_resolver : Raw.Proxy_resolver.t -> proxy_resolver_t
