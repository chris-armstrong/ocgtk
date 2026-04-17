class type network_address_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t
    method get_hostname : unit -> string
    method get_port : unit -> UInt16.t
    method get_scheme : unit -> string option
    method as_network_address : Network_address.t
end

class network_address : Network_address.t -> network_address_t

val new_ : string -> UInt16.t -> network_address_t
val new_loopback : UInt16.t -> network_address_t
