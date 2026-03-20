(* Signal class defined in gresolver_signals.ml *)

class type resolver_t = object
    inherit Gresolver_signals.resolver_signals
    method get_timeout : unit -> int
    method lookup_by_address : GInet_address.inet_address_t -> GCancellable.cancellable_t option -> (string, GError.t) result
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

  method set_default : unit -> unit =
    fun () ->
      (Resolver.set_default obj)

  method set_timeout : int -> unit =
    fun timeout_ms ->
      (Resolver.set_timeout obj timeout_ms)

    method as_resolver = obj
end

