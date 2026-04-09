class type inet_socket_address_t = object
    inherit GSocket_address.socket_address_t
    method get_address : unit -> GInet_address.inet_address_t
    method get_flowinfo : unit -> int
    method get_port : unit -> int
    method get_scope_id : unit -> int
    method as_inet_socket_address : Inet_socket_address.t
end

class inet_socket_address : Inet_socket_address.t -> inet_socket_address_t

val new_ : GInet_address.inet_address_t -> int -> inet_socket_address_t
val new_from_string : string -> int -> inet_socket_address_t
