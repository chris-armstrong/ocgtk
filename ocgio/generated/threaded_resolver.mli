class type threaded_resolver_t = object
  inherit Resolver.resolver_t
  method as_threaded_resolver : Raw.Threaded_resolver.t
end

class threaded_resolver : Raw.Threaded_resolver.t -> threaded_resolver_t
