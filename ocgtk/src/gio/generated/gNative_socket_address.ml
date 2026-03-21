class type native_socket_address_t = object
    method as_native_socket_address : Native_socket_address.t
end

(* High-level class for NativeSocketAddress *)
class native_socket_address (obj : Native_socket_address.t) : native_socket_address_t = object (self)

    method as_native_socket_address = obj
end

