(* Signal class defined in gresolver_signals.ml *)

class type resolver_t = object
    inherit Gresolver_signals.resolver_signals
    method get_timeout : unit -> int
    method lookup_by_address : GInet_address.inet_address_t -> GCancellable.cancellable_t option -> (string, GError.t) result
    method lookup_by_name : string -> GCancellable.cancellable_t option -> (Inet_address.t list, GError.t) result
    method lookup_by_name_with_flags : string -> Gio_enums.resolvernamelookupflags -> GCancellable.cancellable_t option -> (Inet_address.t list, GError.t) result
    method lookup_service : string -> string -> string -> GCancellable.cancellable_t option -> (Srv_target.t list, GError.t) result
    method set_default : unit -> unit
    method set_timeout : int -> unit
    method as_resolver : Resolver.t
end

(* High-level class for Resolver *)
class resolver (obj : Resolver.t) : resolver_t = object (self)
  inherit Gresolver_signals.resolver_signals obj

  method get_timeout : unit -> int =
    fun () ->
      (Resolver.get_timeout obj)

  method lookup_by_address : GInet_address.inet_address_t -> GCancellable.cancellable_t option -> (string, GError.t) result =
    fun address cancellable ->
      let address = address#as_inet_address in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Resolver.lookup_by_address obj address cancellable)

  method lookup_by_name : string -> GCancellable.cancellable_t option -> (Inet_address.t list, GError.t) result =
    fun hostname cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Resolver.lookup_by_name obj hostname cancellable)

  method lookup_by_name_with_flags : string -> Gio_enums.resolvernamelookupflags -> GCancellable.cancellable_t option -> (Inet_address.t list, GError.t) result =
    fun hostname flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Resolver.lookup_by_name_with_flags obj hostname flags cancellable)

  method lookup_service : string -> string -> string -> GCancellable.cancellable_t option -> (Srv_target.t list, GError.t) result =
    fun service protocol domain cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Resolver.lookup_service obj service protocol domain cancellable)

  method set_default : unit -> unit =
    fun () ->
      (Resolver.set_default obj)

  method set_timeout : int -> unit =
    fun timeout_ms ->
      (Resolver.set_timeout obj timeout_ms)

    method as_resolver = obj
end

