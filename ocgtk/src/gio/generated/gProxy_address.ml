class type proxy_address_t = object
  inherit GInet_socket_address.inet_socket_address_t
  method get_destination_hostname : unit -> string
  method get_destination_port : unit -> UInt16.t
  method get_destination_protocol : unit -> string
  method get_password : unit -> string option
  method get_protocol : unit -> string
  method get_uri : unit -> string option
  method get_username : unit -> string option
  method as_proxy_address : Proxy_address.t
end

(* High-level class for ProxyAddress *)
class proxy_address (obj : Proxy_address.t) : proxy_address_t =
  object (self)
    inherit
      GInet_socket_address.inet_socket_address (obj :> Inet_socket_address.t)

    method get_destination_hostname : unit -> string =
      fun () -> Proxy_address.get_destination_hostname obj

    method get_destination_port : unit -> UInt16.t =
      fun () -> Proxy_address.get_destination_port obj

    method get_destination_protocol : unit -> string =
      fun () -> Proxy_address.get_destination_protocol obj

    method get_password : unit -> string option =
      fun () -> Proxy_address.get_password obj

    method get_protocol : unit -> string =
      fun () -> Proxy_address.get_protocol obj

    method get_uri : unit -> string option = fun () -> Proxy_address.get_uri obj

    method get_username : unit -> string option =
      fun () -> Proxy_address.get_username obj

    method as_proxy_address = obj
  end

let new_ (inetaddr : GInet_address.inet_address_t) (port : UInt16.t)
    (protocol : string) (dest_hostname : string) (dest_port : UInt16.t)
    (username : string option) (password : string option) : proxy_address_t =
  let inetaddr = inetaddr#as_inet_address in
  let obj_ =
    Proxy_address.new_ inetaddr port protocol dest_hostname dest_port username
      password
  in
  new proxy_address obj_
