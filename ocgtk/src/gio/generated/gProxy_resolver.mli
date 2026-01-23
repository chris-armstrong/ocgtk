class proxy_resolver : Proxy_resolver.t ->
  object
    method is_supported : unit -> bool
    method lookup : string -> #GCancellable.cancellable option -> (string array, GError.t) result
    method as_proxy_resolver : Proxy_resolver.t
  end

