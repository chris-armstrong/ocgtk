class type network_address_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t
    method get_hostname : unit -> string
    method get_scheme : unit -> string option
    method as_network_address : Network_address.t
end

(* High-level class for NetworkAddress *)
class network_address (obj : Network_address.t) : network_address_t = object (self)
  inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable (Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.from_gobject obj)

  method get_hostname : unit -> string =
    fun () ->
      (Network_address.get_hostname obj)

  method get_scheme : unit -> string option =
    fun () ->
      (Network_address.get_scheme obj)

    method as_network_address = obj
end

