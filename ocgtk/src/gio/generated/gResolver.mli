class type resolver_t = object
    inherit Gresolver_signals.resolver_signals
    method get_timeout : unit -> int
    method lookup_by_address : GInet_address.inet_address_t -> GCancellable.cancellable_t option -> (string, GError.t) result
    method lookup_by_name : string -> GCancellable.cancellable_t option -> (GInet_address.inet_address_t list, GError.t) result
    method lookup_by_name_with_flags : string -> Gio_enums.resolvernamelookupflags -> GCancellable.cancellable_t option -> (GInet_address.inet_address_t list, GError.t) result
    method lookup_service : string -> string -> string -> GCancellable.cancellable_t option -> (Srv_target.t list, GError.t) result
    method set_default : unit -> unit
    method set_timeout : int -> unit
    method as_resolver : Resolver.t
end

class resolver : Resolver.t -> resolver_t

