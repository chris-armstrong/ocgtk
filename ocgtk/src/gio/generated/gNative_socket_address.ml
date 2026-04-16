class type native_socket_address_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_address_t
    method as_native_socket_address : Native_socket_address.t
end

(* High-level class for NativeSocketAddress *)
class native_socket_address (obj : Native_socket_address.t) : native_socket_address_t = object (self)
  inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_address (obj :> Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.t)

    method as_native_socket_address = obj
end

