(* High-level class for NativeSocketAddress *)
class native_socket_address (obj : Native_socket_address.t) = object (self)

    method as_native_socket_address = obj
end

