class network_service : Network_service.t ->
  object
    method get_domain : unit -> string
    method get_protocol : unit -> string
    method get_scheme : unit -> string
    method get_service : unit -> string
    method set_scheme : string -> unit
    method as_network_service : Network_service.t
  end

