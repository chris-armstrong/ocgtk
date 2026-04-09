class type network_address_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t
    method get_hostname : unit -> string
    method get_scheme : unit -> string option
    method as_network_address : Network_address.t
end

class network_address : Network_address.t -> network_address_t

