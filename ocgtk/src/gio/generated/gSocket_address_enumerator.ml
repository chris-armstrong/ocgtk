(* High-level class for SocketAddressEnumerator *)
class socket_address_enumerator (obj : Socket_address_enumerator.t) = object (self)

  method next : 'p1. (#GCancellable.cancellable as 'p1) option -> (GSocket_address.socket_address option, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new GSocket_address.socket_address ret) ret)(Socket_address_enumerator.next obj cancellable)

    method as_socket_address_enumerator = obj
end

