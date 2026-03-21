class type network_address_t = object
    method get_hostname : unit -> string
    method get_scheme : unit -> string option
    method as_network_address : Network_address.t
end

(* High-level class for NetworkAddress *)
class network_address (obj : Network_address.t) : network_address_t = object (self)

  method get_hostname : unit -> string =
    fun () ->
      (Network_address.get_hostname obj)

  method get_scheme : unit -> string option =
    fun () ->
      (Network_address.get_scheme obj)

    method as_network_address = obj
end

