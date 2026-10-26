class type threaded_resolver_t = object
  inherit GResolver.resolver_t
  method as_threaded_resolver : Threaded_resolver.t
end

(* High-level class for ThreadedResolver *)
class threaded_resolver (obj : Threaded_resolver.t) : threaded_resolver_t =
  object (self)
    inherit GResolver.resolver (obj :> Resolver.t)
    method as_threaded_resolver = obj
  end
