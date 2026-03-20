class type threaded_resolver_t = object
    method as_threaded_resolver : Threaded_resolver.t
end

(* High-level class for ThreadedResolver *)
class threaded_resolver (obj : Threaded_resolver.t) : threaded_resolver_t = object (self)

    method as_threaded_resolver = obj
end

