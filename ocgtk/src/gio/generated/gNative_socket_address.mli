class type native_socket_address_t = object
    inherit GSocket_address.socket_address_t
    method as_native_socket_address : Native_socket_address.t
end

class native_socket_address : Native_socket_address.t -> native_socket_address_t

