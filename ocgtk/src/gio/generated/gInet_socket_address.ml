(* High-level class for InetSocketAddress *)
class inet_socket_address (obj : Inet_socket_address.t) = object (self)

  method get_address : unit -> GInet_address.inet_address =
    fun () ->
      new  GInet_address.inet_address(Inet_socket_address.get_address obj)

    method as_inet_socket_address = obj
end

