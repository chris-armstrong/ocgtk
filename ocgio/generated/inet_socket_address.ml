class type inet_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method get_address : unit -> Inet_address.inet_address_t
  method get_flowinfo : unit -> UInt32.t
  method get_port : unit -> UInt16.t
  method get_scope_id : unit -> UInt32.t
  method as_inet_socket_address : Raw.Inet_socket_address.t
end

(* High-level class for InetSocketAddress *)
class inet_socket_address (obj : Raw.Inet_socket_address.t) :
  inet_socket_address_t =
  object (self)
    inherit
      Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address
        (obj :> Raw.Socket_address.t)

    method get_address : unit -> Inet_address.inet_address_t =
      fun () ->
        new Inet_address.inet_address (Raw.Inet_socket_address.get_address obj)

    method get_flowinfo : unit -> UInt32.t =
      fun () -> Raw.Inet_socket_address.get_flowinfo obj

    method get_port : unit -> UInt16.t =
      fun () -> Raw.Inet_socket_address.get_port obj

    method get_scope_id : unit -> UInt32.t =
      fun () -> Raw.Inet_socket_address.get_scope_id obj

    method as_inet_socket_address = obj
  end

let new_ (address : Inet_address.inet_address_t) (port : UInt16.t) :
    inet_socket_address_t =
  let address = address#as_inet_address in
  let obj_ = Raw.Inet_socket_address.new_ address port in
  new inet_socket_address obj_

let new_from_string (address : string) (port : int) : inet_socket_address_t =
  let obj_ = Raw.Inet_socket_address.new_from_string address port in
  new inet_socket_address obj_
