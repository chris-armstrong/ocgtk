class inet_socket_address : Inet_socket_address.t ->
  object
    method get_address : unit -> GInet_address.inet_address
    method as_inet_socket_address : Inet_socket_address.t
  end

