class type unix_socket_address_t = object
    method get_address_type : unit -> Gio_enums.unixsocketaddresstype
    method get_is_abstract : unit -> bool
    method get_path : unit -> string
    method abstract : bool
    method as_unix_socket_address : Unix_socket_address.t
end

class unix_socket_address : Unix_socket_address.t -> unix_socket_address_t

