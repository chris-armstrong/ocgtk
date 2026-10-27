class type resolver_t = object
  method on_reload :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_timeout : unit -> int
  (** Get the timeout applied to all resolver lookups. See [GResolver:timeout].
  *)

  method lookup_by_address :
    Inet_address.inet_address_t ->
    Cancellable.cancellable_t option ->
    (string, GError.t) result
  (** Synchronously reverse-resolves [address] to determine its associated
      hostname.

      If the DNS resolution fails, [error] (if non-[NULL]) will be set to a
      value from [GResolverError].

      If [cancellable] is non-[NULL], it can be used to cancel the operation, in
      which case [error] (if non-[NULL]) will be set to [G_IO_ERROR_CANCELLED].
  *)

  method lookup_by_address_finish :
    Async_result.async_result_t -> (string, GError.t) result
  (** Retrieves the result of a previous call to
      g_resolver_lookup_by_address_async().

      If the DNS resolution failed, [error] (if non-[NULL]) will be set to a
      value from [GResolverError]. If the operation was cancelled, [error] will
      be set to [G_IO_ERROR_CANCELLED]. *)

  method lookup_by_name :
    string ->
    Cancellable.cancellable_t option ->
    (Inet_address.inet_address_t list, GError.t) result
  (** Synchronously resolves [hostname] to determine its associated IP
      address(es). [hostname] may be an ASCII-only or UTF-8 hostname, or the
      textual form of an IP address (in which case this just becomes a wrapper
      around g_inet_address_new_from_string()).

      On success, g_resolver_lookup_by_name() will return a non-empty [GList] of
      [GInetAddress], sorted in order of preference and guaranteed to not
      contain duplicates. That is, if using the result to connect to [hostname],
      you should attempt to connect to the first address first, then the second
      if the first fails, etc. If you are using the result to listen on a
      socket, it is appropriate to add each result using e.g.
      g_socket_listener_add_address().

      If the DNS resolution fails, [error] (if non-[NULL]) will be set to a
      value from [GResolverError] and [NULL] will be returned.

      If [cancellable] is non-[NULL], it can be used to cancel the operation, in
      which case [error] (if non-[NULL]) will be set to [G_IO_ERROR_CANCELLED].

      If you are planning to connect to a socket on the resolved IP address, it
      may be easier to create a [GNetworkAddress] and use its
      [GSocketConnectable] interface. *)

  method lookup_by_name_finish :
    Async_result.async_result_t ->
    (Inet_address.inet_address_t list, GError.t) result
  (** Retrieves the result of a call to g_resolver_lookup_by_name_async().

      If the DNS resolution failed, [error] (if non-[NULL]) will be set to a
      value from [GResolverError]. If the operation was cancelled, [error] will
      be set to [G_IO_ERROR_CANCELLED]. *)

  method lookup_by_name_with_flags :
    string ->
    Enums.resolvernamelookupflags ->
    Cancellable.cancellable_t option ->
    (Inet_address.inet_address_t list, GError.t) result
  (** This differs from g_resolver_lookup_by_name() in that you can modify the
      lookup behavior with [flags]. For example this can be used to limit
      results with [G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY]. *)

  method lookup_by_name_with_flags_finish :
    Async_result.async_result_t ->
    (Inet_address.inet_address_t list, GError.t) result
  (** Retrieves the result of a call to
      g_resolver_lookup_by_name_with_flags_async().

      If the DNS resolution failed, [error] (if non-[NULL]) will be set to a
      value from [GResolverError]. If the operation was cancelled, [error] will
      be set to [G_IO_ERROR_CANCELLED]. *)

  method lookup_records :
    string ->
    Enums.resolverrecordtype ->
    Cancellable.cancellable_t option ->
    (Gvariant.t list, GError.t) result
  (** Synchronously performs a DNS record lookup for the given [rrname] and
      returns a list of records as [GVariant] tuples. See [GResolverRecordType]
      for information on what the records contain for each [record_type].

      If the DNS resolution fails, [error] (if non-[NULL]) will be set to a
      value from [GResolverError] and [NULL] will be returned.

      If [cancellable] is non-[NULL], it can be used to cancel the operation, in
      which case [error] (if non-[NULL]) will be set to [G_IO_ERROR_CANCELLED].
  *)

  method lookup_records_finish :
    Async_result.async_result_t -> (Gvariant.t list, GError.t) result
  (** Retrieves the result of a previous call to
      g_resolver_lookup_records_async(). Returns a non-empty list of records as
      [GVariant] tuples. See [GResolverRecordType] for information on what the
      records contain.

      If the DNS resolution failed, [error] (if non-[NULL]) will be set to a
      value from [GResolverError]. If the operation was cancelled, [error] will
      be set to [G_IO_ERROR_CANCELLED]. *)

  method lookup_service :
    string ->
    string ->
    string ->
    Cancellable.cancellable_t option ->
    (Raw.Srv_target.t list, GError.t) result
  (** Synchronously performs a DNS SRV lookup for the given [service] and
      [protocol] in the given [domain] and returns an array of [GSrvTarget].
      [domain] may be an ASCII-only or UTF-8 hostname. Note also that the
      [service] and [protocol] arguments do not include the leading underscore
      that appears in the actual DNS entry.

      On success, g_resolver_lookup_service() will return a non-empty [GList] of
      [GSrvTarget], sorted in order of preference. (That is, you should attempt
      to connect to the first target first, then the second if the first fails,
      etc.)

      If the DNS resolution fails, [error] (if non-[NULL]) will be set to a
      value from [GResolverError] and [NULL] will be returned.

      If [cancellable] is non-[NULL], it can be used to cancel the operation, in
      which case [error] (if non-[NULL]) will be set to [G_IO_ERROR_CANCELLED].

      If you are planning to connect to the service, it is usually easier to
      create a [GNetworkService] and use its [GSocketConnectable] interface. *)

  method lookup_service_finish :
    Async_result.async_result_t -> (Raw.Srv_target.t list, GError.t) result
  (** Retrieves the result of a previous call to
      g_resolver_lookup_service_async().

      If the DNS resolution failed, [error] (if non-[NULL]) will be set to a
      value from [GResolverError]. If the operation was cancelled, [error] will
      be set to [G_IO_ERROR_CANCELLED]. *)

  method set_default : unit -> unit
  [@@ocaml.doc
    "Sets [resolver] to be the application's default resolver (reffing\n\
     [resolver], and unreffing the previous default resolver, if any).\n\
     Future calls to g_resolver_get_default() will return this resolver.\n\n\
     This can be used if an application wants to perform any sort of DNS\n\
     caching or \"pinning\"; it can implement its own [GResolver] that\n\
     calls the original default resolver for DNS operations, and\n\
     implements its own cache policies on top of that, and then set\n\
     itself as the default resolver for all later code to use."]

  method set_timeout : int -> unit
  (** Set the timeout applied to all resolver lookups. See [GResolver:timeout].
  *)

  method as_resolver : Raw.Resolver.t
end

(* High-level class for Resolver *)
class resolver (obj : Raw.Resolver.t) : resolver_t =
  object (self)
    method on_reload ?(after = false) ~callback () =
      Raw.Resolver.on_reload ~after self#as_resolver ~callback

    method get_timeout : unit -> int = fun () -> Raw.Resolver.get_timeout obj

    method lookup_by_address :
        Inet_address.inet_address_t ->
        Cancellable.cancellable_t option ->
        (string, GError.t) result =
      fun address cancellable ->
        let address = address#as_inet_address in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Resolver.lookup_by_address obj address cancellable

    method lookup_by_address_finish :
        Async_result.async_result_t -> (string, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Resolver.lookup_by_address_finish obj result

    method lookup_by_name :
        string ->
        Cancellable.cancellable_t option ->
        (Inet_address.inet_address_t list, GError.t) result =
      fun hostname cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (List.map (fun ret -> new Inet_address.inet_address ret))
          (Raw.Resolver.lookup_by_name obj hostname cancellable)

    method lookup_by_name_finish :
        Async_result.async_result_t ->
        (Inet_address.inet_address_t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (List.map (fun ret -> new Inet_address.inet_address ret))
          (Raw.Resolver.lookup_by_name_finish obj result)

    method lookup_by_name_with_flags :
        string ->
        Enums.resolvernamelookupflags ->
        Cancellable.cancellable_t option ->
        (Inet_address.inet_address_t list, GError.t) result =
      fun hostname flags cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (List.map (fun ret -> new Inet_address.inet_address ret))
          (Raw.Resolver.lookup_by_name_with_flags obj hostname flags cancellable)

    method lookup_by_name_with_flags_finish :
        Async_result.async_result_t ->
        (Inet_address.inet_address_t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (List.map (fun ret -> new Inet_address.inet_address ret))
          (Raw.Resolver.lookup_by_name_with_flags_finish obj result)

    method lookup_records :
        string ->
        Enums.resolverrecordtype ->
        Cancellable.cancellable_t option ->
        (Gvariant.t list, GError.t) result =
      fun rrname record_type cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Resolver.lookup_records obj rrname record_type cancellable

    method lookup_records_finish :
        Async_result.async_result_t -> (Gvariant.t list, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Resolver.lookup_records_finish obj result

    method lookup_service :
        string ->
        string ->
        string ->
        Cancellable.cancellable_t option ->
        (Raw.Srv_target.t list, GError.t) result =
      fun service protocol domain cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Resolver.lookup_service obj service protocol domain cancellable

    method lookup_service_finish :
        Async_result.async_result_t -> (Raw.Srv_target.t list, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Resolver.lookup_service_finish obj result

    method set_default : unit -> unit = fun () -> Raw.Resolver.set_default obj

    method set_timeout : int -> unit =
      fun timeout_ms -> Raw.Resolver.set_timeout obj timeout_ms

    method as_resolver = obj
  end
