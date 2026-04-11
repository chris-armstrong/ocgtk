class type inet_socket_address_t = object
  inherit
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method get_address : unit -> GInet_address.inet_address_t
  method get_flowinfo : unit -> UInt32.t
  method get_port : unit -> UInt16.t
  method get_scope_id : unit -> UInt32.t
  method as_inet_socket_address : Inet_socket_address.t
end

class inet_socket_address : Inet_socket_address.t -> inet_socket_address_t

val new_ : GInet_address.inet_address_t -> UInt16.t -> inet_socket_address_t
val new_from_string : string -> int -> inet_socket_address_t
