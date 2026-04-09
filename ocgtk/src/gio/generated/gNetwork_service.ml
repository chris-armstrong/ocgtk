class type network_service_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t
    method get_domain : unit -> string
    method get_protocol : unit -> string
    method get_scheme : unit -> string
    method get_service : unit -> string
    method set_scheme : string -> unit
    method as_network_service : Network_service.t
end

(* High-level class for NetworkService *)
class network_service (obj : Network_service.t) : network_service_t = object (self)
  inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable (Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_connectable.from_gobject obj)

  method get_domain : unit -> string =
    fun () ->
      (Network_service.get_domain obj)

  method get_protocol : unit -> string =
    fun () ->
      (Network_service.get_protocol obj)

  method get_scheme : unit -> string =
    fun () ->
      (Network_service.get_scheme obj)

  method get_service : unit -> string =
    fun () ->
      (Network_service.get_service obj)

  method set_scheme : string -> unit =
    fun scheme ->
      (Network_service.set_scheme obj scheme)

    method as_network_service = obj
end

let new_ (service : string) (protocol : string) (domain : string) : network_service_t =
  let obj_ = Network_service.new_ service protocol domain in
  new network_service obj_

