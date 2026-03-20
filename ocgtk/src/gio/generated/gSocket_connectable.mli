class type socket_connectable_t = object
    method enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator_t
    method proxy_enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator_t
    method to_string : unit -> string
    method as_socket_connectable : Socket_connectable.t
end

class socket_connectable : Socket_connectable.t -> socket_connectable_t

