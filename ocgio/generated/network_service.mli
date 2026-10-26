class type network_service_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_domain : unit -> string
  method get_protocol : unit -> string
  method get_scheme : unit -> string
  method get_service : unit -> string
  method set_scheme : string -> unit
  method as_network_service : Raw.Network_service.t
end

class network_service : Raw.Network_service.t -> network_service_t

val new_ : string -> string -> string -> network_service_t
