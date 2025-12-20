class resolver : Resolver.t ->
  object
    inherit Gresolver_signals.resolver_signals
    method get_timeout : unit -> int
    method lookup_by_address : #GInet_address.inet_address -> #GCancellable.cancellable option -> (string, GError.t) result
    method set_default : unit -> unit
    method set_timeout : int -> unit
    method as_resolver : Resolver.t
  end

