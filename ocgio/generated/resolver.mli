(** The object that handles DNS resolution. Use [Gio.Resolver.get_default] to
    get the default resolver.

    Its methods, signals and properties are on {!class-type-resolver_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Resolver}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Resolver].}

    The object that handles DNS resolution. Use [Gio.Resolver.get_default] to
    get the default resolver.

    [GResolver] provides cancellable synchronous and asynchronous DNS
    resolution, for hostnames
    ({{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_address}[Gio.Resolver.lookup_by_address]},
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_name}[Gio.Resolver.lookup_by_name]}
    and their async variants) and SRV (service) records
    ({{!Ocgio.Resolver.class-type-resolver_t.method-lookup_service}[Gio.Resolver.lookup_service]}).

    {{!Ocgio.Network_address.class-type-network_address_t}[Gio.NetworkAddress]}
    and
    {{!Ocgio.Network_service.class-type-network_service_t}[Gio.NetworkService]}
    provide wrappers around [GResolver] functionality that also implement
    {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}[Gio.SocketConnectable]},
    making it easy to connect to a remote host/service.

    The default resolver (see [Gio.Resolver.get_default]) has a timeout of 30s
    set on it since GLib 2.78. Earlier versions of GLib did not support resolver
    timeouts.

    This is an abstract type; subclasses of it implement different resolvers for
    different platforms and situations. *)
class type resolver_t = object
  (** {2:signals Signals} *)

  method on_reload :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the resolver notices that the system resolver configuration
      has changed. *)

  (** {2:methods Methods} *)

  method get_timeout : unit -> int
  (** Get the timeout applied to all resolver lookups. See [GResolver:timeout].
  *)

  method lookup_by_address :
    Inet_address.inet_address_t ->
    Cancellable.cancellable_t option ->
    (string, GError.t) result
  (** Synchronously reverse-resolves [address] to determine its associated
      hostname.

      If the DNS resolution fails, [error] (if non-[None]) will be set to a
      value from [GResolverError].

      If [cancellable] is non-[None], it can be used to cancel the operation, in
      which case [error] (if non-[None]) will be set to [G_IO_ERROR_CANCELLED].
  *)

  method lookup_by_address_finish :
    Async_result.async_result_t -> (string, GError.t) result
  (** Retrieves the result of a previous call to
      g_resolver_lookup_by_address_async().

      If the DNS resolution failed, [error] (if non-[None]) will be set to a
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

      If the DNS resolution fails, [error] (if non-[None]) will be set to a
      value from [GResolverError] and [None] will be returned.

      If [cancellable] is non-[None], it can be used to cancel the operation, in
      which case [error] (if non-[None]) will be set to [G_IO_ERROR_CANCELLED].

      If you are planning to connect to a socket on the resolved IP address, it
      may be easier to create a [GNetworkAddress] and use its
      [GSocketConnectable] interface. *)

  method lookup_by_name_finish :
    Async_result.async_result_t ->
    (Inet_address.inet_address_t list, GError.t) result
  (** Retrieves the result of a call to g_resolver_lookup_by_name_async().

      If the DNS resolution failed, [error] (if non-[None]) will be set to a
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

      If the DNS resolution failed, [error] (if non-[None]) will be set to a
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

      If the DNS resolution fails, [error] (if non-[None]) will be set to a
      value from [GResolverError] and [None] will be returned.

      If [cancellable] is non-[None], it can be used to cancel the operation, in
      which case [error] (if non-[None]) will be set to [G_IO_ERROR_CANCELLED].
  *)

  method lookup_records_finish :
    Async_result.async_result_t -> (Gvariant.t list, GError.t) result
  (** Retrieves the result of a previous call to
      g_resolver_lookup_records_async(). Returns a non-empty list of records as
      [GVariant] tuples. See [GResolverRecordType] for information on what the
      records contain.

      If the DNS resolution failed, [error] (if non-[None]) will be set to a
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

      If the DNS resolution fails, [error] (if non-[None]) will be set to a
      value from [GResolverError] and [None] will be returned.

      If [cancellable] is non-[None], it can be used to cancel the operation, in
      which case [error] (if non-[None]) will be set to [G_IO_ERROR_CANCELLED].

      If you are planning to connect to the service, it is usually easier to
      create a [GNetworkService] and use its [GSocketConnectable] interface. *)

  method lookup_service_finish :
    Async_result.async_result_t -> (Raw.Srv_target.t list, GError.t) result
  (** Retrieves the result of a previous call to
      g_resolver_lookup_service_async().

      If the DNS resolution failed, [error] (if non-[None]) will be set to a
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

  (** {2:conversions Conversions} *)

  method as_resolver : Raw.Resolver.t
end

class resolver : Raw.Resolver.t -> resolver_t
(** Wraps a raw handle of {!Ocgio.Raw.Resolver.t}. *)

(** {1:description Description}

    The object that handles DNS resolution. Use [Gio.Resolver.get_default] to
    get the default resolver.

    [GResolver] provides cancellable synchronous and asynchronous DNS
    resolution, for hostnames
    ({{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_address}[Gio.Resolver.lookup_by_address]},
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_name}[Gio.Resolver.lookup_by_name]}
    and their async variants) and SRV (service) records
    ({{!Ocgio.Resolver.class-type-resolver_t.method-lookup_service}[Gio.Resolver.lookup_service]}).

    {{!Ocgio.Network_address.class-type-network_address_t}[Gio.NetworkAddress]}
    and
    {{!Ocgio.Network_service.class-type-network_service_t}[Gio.NetworkService]}
    provide wrappers around [GResolver] functionality that also implement
    {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}[Gio.SocketConnectable]},
    making it easy to connect to a remote host/service.

    The default resolver (see [Gio.Resolver.get_default]) has a timeout of 30s
    set on it since GLib 2.78. Earlier versions of GLib did not support resolver
    timeouts.

    This is an abstract type; subclasses of it implement different resolvers for
    different platforms and situations. *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
