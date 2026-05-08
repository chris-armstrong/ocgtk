class type resolver_t = object
  method on_reload : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method get_timeout : unit -> int

  method lookup_by_address :
    GInet_address.inet_address_t ->
    GCancellable.cancellable_t option ->
    (string, GError.t) result

  method lookup_by_address_finish :
    GAsync_result.async_result_t -> (string, GError.t) result

  method lookup_by_name :
    string ->
    GCancellable.cancellable_t option ->
    (GInet_address.inet_address_t list, GError.t) result

  method lookup_by_name_finish :
    GAsync_result.async_result_t ->
    (GInet_address.inet_address_t list, GError.t) result

  method lookup_by_name_with_flags :
    string ->
    Gio_enums.resolvernamelookupflags ->
    GCancellable.cancellable_t option ->
    (GInet_address.inet_address_t list, GError.t) result

  method lookup_by_name_with_flags_finish :
    GAsync_result.async_result_t ->
    (GInet_address.inet_address_t list, GError.t) result

  method lookup_records :
    string ->
    Gio_enums.resolverrecordtype ->
    GCancellable.cancellable_t option ->
    (Gvariant.t list, GError.t) result

  method lookup_records_finish :
    GAsync_result.async_result_t -> (Gvariant.t list, GError.t) result

  method lookup_service :
    string ->
    string ->
    string ->
    GCancellable.cancellable_t option ->
    (Srv_target.t list, GError.t) result

  method lookup_service_finish :
    GAsync_result.async_result_t -> (Srv_target.t list, GError.t) result

  method set_default : unit -> unit
  method set_timeout : int -> unit
  method as_resolver : Resolver.t
end

(* High-level class for Resolver *)
class resolver (obj : Resolver.t) : resolver_t =
  object (self)
    method on_reload ~callback = Resolver.on_reload self#as_resolver ~callback
    method get_timeout : unit -> int = fun () -> Resolver.get_timeout obj

    method lookup_by_address :
        GInet_address.inet_address_t ->
        GCancellable.cancellable_t option ->
        (string, GError.t) result =
      fun address cancellable ->
        let address = address#as_inet_address in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Resolver.lookup_by_address obj address cancellable

    method lookup_by_address_finish :
        GAsync_result.async_result_t -> (string, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Resolver.lookup_by_address_finish obj result

    method lookup_by_name :
        string ->
        GCancellable.cancellable_t option ->
        (GInet_address.inet_address_t list, GError.t) result =
      fun hostname cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (List.map (fun ret -> new GInet_address.inet_address ret))
          (Resolver.lookup_by_name obj hostname cancellable)

    method lookup_by_name_finish :
        GAsync_result.async_result_t ->
        (GInet_address.inet_address_t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (List.map (fun ret -> new GInet_address.inet_address ret))
          (Resolver.lookup_by_name_finish obj result)

    method lookup_by_name_with_flags :
        string ->
        Gio_enums.resolvernamelookupflags ->
        GCancellable.cancellable_t option ->
        (GInet_address.inet_address_t list, GError.t) result =
      fun hostname flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (List.map (fun ret -> new GInet_address.inet_address ret))
          (Resolver.lookup_by_name_with_flags obj hostname flags cancellable)

    method lookup_by_name_with_flags_finish :
        GAsync_result.async_result_t ->
        (GInet_address.inet_address_t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (List.map (fun ret -> new GInet_address.inet_address ret))
          (Resolver.lookup_by_name_with_flags_finish obj result)

    method lookup_records :
        string ->
        Gio_enums.resolverrecordtype ->
        GCancellable.cancellable_t option ->
        (Gvariant.t list, GError.t) result =
      fun rrname record_type cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Resolver.lookup_records obj rrname record_type cancellable

    method lookup_records_finish :
        GAsync_result.async_result_t -> (Gvariant.t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Resolver.lookup_records_finish obj result

    method lookup_service :
        string ->
        string ->
        string ->
        GCancellable.cancellable_t option ->
        (Srv_target.t list, GError.t) result =
      fun service protocol domain cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Resolver.lookup_service obj service protocol domain cancellable

    method lookup_service_finish :
        GAsync_result.async_result_t -> (Srv_target.t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Resolver.lookup_service_finish obj result

    method set_default : unit -> unit = fun () -> Resolver.set_default obj

    method set_timeout : int -> unit =
      fun timeout_ms -> Resolver.set_timeout obj timeout_ms

    method as_resolver = obj
  end
