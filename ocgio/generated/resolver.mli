(** The object that handles DNS resolution. Use [Gio.Resolver.get_default] to
    get the default resolver.

    [GResolver] provides cancellable synchronous and asynchronous DNS
    resolution, for hostnames ([Gio.Resolver.lookup_by_address],
    [Gio.Resolver.lookup_by_name] and their async variants) and SRV (service)
    records ([Gio.Resolver.lookup_service]).

    [Gio.NetworkAddress] and [Gio.NetworkService] provide wrappers around
    [GResolver] functionality that also implement [Gio.SocketConnectable],
    making it easy to connect to a remote host/service.

    The default resolver (see [Gio.Resolver.get_default]) has a timeout of 30s
    set on it since GLib 2.78. Earlier versions of GLib did not support resolver
    timeouts.

    This is an abstract type; subclasses of it implement different resolvers for
    different platforms and situations.

    Its methods, signals and properties are on {!class-type-resolver_t}. The
    functions it is built on are in {!Ocgio.Raw.Resolver}. *)

(** The methods, signals and properties of a [GResolver]. *)
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
(** Wraps a layer 1 handle, {!Ocgio.Raw.Resolver.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GResolver], give one already wrapped. *)
