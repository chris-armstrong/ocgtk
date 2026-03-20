class type inet_socket_address_t = object
    method get_address : unit -> GInet_address.inet_address_t
    method as_inet_socket_address : Inet_socket_address.t
end

(* High-level class for InetSocketAddress *)
class inet_socket_address (obj : Inet_socket_address.t) : inet_socket_address_t = object (self)

  method get_address : unit -> GInet_address.inet_address_t =
    fun () ->
      new  GInet_address.inet_address(Inet_socket_address.get_address obj)

    method as_inet_socket_address = obj
end

