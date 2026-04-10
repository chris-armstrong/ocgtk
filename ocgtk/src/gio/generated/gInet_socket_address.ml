class type inet_socket_address_t = object
    inherit GSocket_address.socket_address_t
    method get_address : unit -> GInet_address.inet_address_t
    method get_flowinfo : unit -> int
    method get_port : unit -> int
    method get_scope_id : unit -> int
    method as_inet_socket_address : Inet_socket_address.t
end

(* High-level class for InetSocketAddress *)
class inet_socket_address (obj : Inet_socket_address.t) : inet_socket_address_t = object (self)
  inherit GSocket_address.socket_address (obj :> Socket_address.t)

  method get_address : unit -> GInet_address.inet_address_t =
    fun () ->
      new  GInet_address.inet_address(Inet_socket_address.get_address obj)

  method get_flowinfo : unit -> int =
    fun () ->
      (Inet_socket_address.get_flowinfo obj)

  method get_port : unit -> int =
    fun () ->
      (Inet_socket_address.get_port obj)

  method get_scope_id : unit -> int =
    fun () ->
      (Inet_socket_address.get_scope_id obj)

    method as_inet_socket_address = obj
end

let new_ (address : GInet_address.inet_address_t) (port : int) : inet_socket_address_t =
  let address = address#as_inet_address in
  let obj_ = Inet_socket_address.new_ address port in
  new inet_socket_address obj_

let new_from_string (address : string) (port : int) : inet_socket_address_t =
  let obj_ = Inet_socket_address.new_from_string address port in
  new inet_socket_address obj_

