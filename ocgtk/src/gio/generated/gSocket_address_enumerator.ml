class type socket_address_enumerator_t = object
    method next : GCancellable.cancellable_t option -> (GSocket_address.socket_address_t option, GError.t) result
    method as_socket_address_enumerator : Socket_address_enumerator.t
end

(* High-level class for SocketAddressEnumerator *)
class socket_address_enumerator (obj : Socket_address_enumerator.t) : socket_address_enumerator_t = object (self)

  method next : GCancellable.cancellable_t option -> (GSocket_address.socket_address_t option, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> Option.map (fun ret -> new GSocket_address.socket_address ret) ret)(Socket_address_enumerator.next obj cancellable)

    method as_socket_address_enumerator = obj
end

