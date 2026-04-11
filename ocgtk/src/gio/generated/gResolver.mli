class type resolver_t = object
    inherit Gresolver_signals.resolver_signals
    method get_timeout : unit -> int
    method lookup_by_address : GInet_address.inet_address_t -> GCancellable.cancellable_t option -> (string, GError.t) result
    method lookup_by_address_finish : GAsync_result.async_result_t -> (string, GError.t) result
    method lookup_by_name : string -> GCancellable.cancellable_t option -> (Inet_address.t list, GError.t) result
    method lookup_by_name_finish : GAsync_result.async_result_t -> (Inet_address.t list, GError.t) result
    method lookup_by_name_with_flags : string -> Gio_enums.resolvernamelookupflags -> GCancellable.cancellable_t option -> (Inet_address.t list, GError.t) result
    method lookup_by_name_with_flags_finish : GAsync_result.async_result_t -> (Inet_address.t list, GError.t) result
    method lookup_records : string -> Gio_enums.resolverrecordtype -> GCancellable.cancellable_t option -> (Gvariant.t list, GError.t) result
    method lookup_records_finish : GAsync_result.async_result_t -> (Gvariant.t list, GError.t) result
    method lookup_service : string -> string -> string -> GCancellable.cancellable_t option -> (Srv_target.t list, GError.t) result
    method lookup_service_finish : GAsync_result.async_result_t -> (Srv_target.t list, GError.t) result
    method set_default : unit -> unit
    method set_timeout : int -> unit
    method as_resolver : Resolver.t
end

class resolver : Resolver.t -> resolver_t

