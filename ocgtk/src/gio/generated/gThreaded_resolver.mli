class type threaded_resolver_t = object
  inherit GResolver.resolver_t
  method as_threaded_resolver : Threaded_resolver.t
end

class threaded_resolver : Threaded_resolver.t -> threaded_resolver_t
