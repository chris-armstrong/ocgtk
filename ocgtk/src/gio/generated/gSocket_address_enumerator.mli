class type socket_address_enumerator_t = object
    method next : GCancellable.cancellable_t option -> (GSocket_address.socket_address_t option, GError.t) result
    method as_socket_address_enumerator : Socket_address_enumerator.t
end

class socket_address_enumerator : Socket_address_enumerator.t -> socket_address_enumerator_t

