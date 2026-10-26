class type network_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_hostname : unit -> string
  method get_port : unit -> UInt16.t
  method get_scheme : unit -> string option
  method as_network_address : Raw.Network_address.t
end

(* High-level class for NetworkAddress *)
class network_address (obj : Raw.Network_address.t) : network_address_t =
  object (self)
    inherit
      Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_connectable
        (Raw.Socket_connectable.from_gobject obj)

    method get_hostname : unit -> string =
      fun () -> Raw.Network_address.get_hostname obj

    method get_port : unit -> UInt16.t =
      fun () -> Raw.Network_address.get_port obj

    method get_scheme : unit -> string option =
      fun () -> Raw.Network_address.get_scheme obj

    method as_network_address = obj
  end

let new_ (hostname : string) (port : UInt16.t) : network_address_t =
  let obj_ = Raw.Network_address.new_ hostname port in
  new network_address obj_

let new_loopback (port : UInt16.t) : network_address_t =
  let obj_ = Raw.Network_address.new_loopback port in
  new network_address obj_
