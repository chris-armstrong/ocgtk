class type inet_socket_address_t = object
    inherit GSocket_address.socket_address_t
    method get_address : unit -> GInet_address.inet_address_t
    method as_inet_socket_address : Inet_socket_address.t
end

class inet_socket_address : Inet_socket_address.t -> inet_socket_address_t

