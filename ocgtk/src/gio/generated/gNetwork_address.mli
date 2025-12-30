class network_address : Network_address.t ->
  object
    method get_hostname : unit -> string
    method get_scheme : unit -> string option
    method as_network_address : Network_address.t
  end

