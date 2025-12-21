(* Signal class defined in gresolver_signals.ml *)

(* High-level class for Resolver *)
class resolver (obj : Resolver.t) = object (self)
  inherit Gresolver_signals.resolver_signals obj

  method get_timeout : unit -> int =
    fun () ->
      (Resolver.get_timeout obj)

  method lookup_by_address : 'p1 'p2. (#GInet_address.inet_address as 'p1) -> (#GCancellable.cancellable as 'p2) option -> (string, GError.t) result =
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

