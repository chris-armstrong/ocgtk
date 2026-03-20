class type socket_address_t = object
    method get_family : unit -> Gio_enums.socketfamily
    method as_socket_address : Socket_address.t
end

class socket_address : Socket_address.t -> socket_address_t

