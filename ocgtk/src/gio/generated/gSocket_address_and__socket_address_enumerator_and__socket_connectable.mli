
class type socket_address_t = object
    method get_family : unit -> Gio_enums.socketfamily
    method get_native_size : unit -> int
    method as_socket_address : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.t
end

and socket_address_enumerator_t = object
    method next : GCancellable.cancellable_t option -> (socket_address_t option, GError.t) result
    method as_socket_address_enumerator : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address_enumerator.t
end

and socket_connectable_t = object
    method enumerate : unit -> socket_address_enumerator_t
    method proxy_enumerate : unit -> socket_address_enumerator_t
    method to_string : unit -> string
    method as_socket_connectable : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.t
end


class socket_address : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.t -> socket_address_t

and socket_address_enumerator : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address_enumerator.t -> socket_address_enumerator_t

and socket_connectable : Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.t -> socket_connectable_t
