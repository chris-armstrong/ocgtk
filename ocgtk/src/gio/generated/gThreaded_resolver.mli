class type threaded_resolver_t = object
    method as_threaded_resolver : Threaded_resolver.t
end

class threaded_resolver : Threaded_resolver.t -> threaded_resolver_t

