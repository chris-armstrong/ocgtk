class type threaded_resolver_t = object
  inherit Resolver.resolver_t

  (** {2:conversions Conversions} *)

  method as_threaded_resolver : Raw.Threaded_resolver.t
end

(* High-level class for ThreadedResolver *)
class threaded_resolver (obj : Raw.Threaded_resolver.t) : threaded_resolver_t =
  object (self)
    inherit Resolver.resolver (obj :> Raw.Resolver.t)
    method as_threaded_resolver = obj
  end
