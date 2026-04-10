class type network_address_t = object
    method get_hostname : unit -> string
    method get_port : unit -> int
    method get_scheme : unit -> string option
    method as_network_address : Network_address.t
end

class network_address : Network_address.t -> network_address_t

val new_ : string -> int -> network_address_t
val new_loopback : int -> network_address_t
