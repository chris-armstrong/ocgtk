class type resolver_t = object
  method on_reload :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_timeout : unit -> int

  method lookup_by_address :
    Inet_address.inet_address_t ->
    Cancellable.cancellable_t option ->
    (string, GError.t) result

  method lookup_by_address_finish :
    Async_result.async_result_t -> (string, GError.t) result

  method lookup_by_name :
    string ->
    Cancellable.cancellable_t option ->
    (Inet_address.inet_address_t list, GError.t) result

  method lookup_by_name_finish :
    Async_result.async_result_t ->
    (Inet_address.inet_address_t list, GError.t) result

  method lookup_by_name_with_flags :
    string ->
    Enums.resolvernamelookupflags ->
    Cancellable.cancellable_t option ->
    (Inet_address.inet_address_t list, GError.t) result

  method lookup_by_name_with_flags_finish :
    Async_result.async_result_t ->
    (Inet_address.inet_address_t list, GError.t) result

  method lookup_records :
    string ->
    Enums.resolverrecordtype ->
    Cancellable.cancellable_t option ->
    (Gvariant.t list, GError.t) result

  method lookup_records_finish :
    Async_result.async_result_t -> (Gvariant.t list, GError.t) result

  method lookup_service :
    string ->
    string ->
    string ->
    Cancellable.cancellable_t option ->
    (Raw.Srv_target.t list, GError.t) result

  method lookup_service_finish :
    Async_result.async_result_t -> (Raw.Srv_target.t list, GError.t) result

  method set_default : unit -> unit
  method set_timeout : int -> unit
  method as_resolver : Raw.Resolver.t
end

class resolver : Raw.Resolver.t -> resolver_t
