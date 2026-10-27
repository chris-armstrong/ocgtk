class type proxy_address_t = object
  inherit Inet_socket_address.inet_socket_address_t

  method get_destination_hostname : unit -> string
  (** Gets [proxy]'s destination hostname; that is, the name of the host that
      will be connected to via the proxy, not the name of the proxy itself. *)

  method get_destination_port : unit -> UInt16.t
  (** Gets [proxy]'s destination port; that is, the port on the destination host
      that will be connected to via the proxy, not the port number of the proxy
      itself. *)

  method get_destination_protocol : unit -> string
  [@@ocaml.doc
    "Gets the protocol that is being spoken to the destination\n\
     server; eg, \"http\" or \"ftp\"."]

  method get_password : unit -> string option
  (** Gets [proxy]'s password. *)

  method get_protocol : unit -> string
  [@@ocaml.doc "Gets [proxy]'s protocol. eg, \"socks\" or \"http\""]

  method get_uri : unit -> string option
  (** Gets the proxy URI that [proxy] was constructed from. *)

  method get_username : unit -> string option
  (** Gets [proxy]'s username. *)

  method as_proxy_address : Raw.Proxy_address.t
end

(* High-level class for ProxyAddress *)
class proxy_address (obj : Raw.Proxy_address.t) : proxy_address_t =
  object (self)
    inherit
      Inet_socket_address.inet_socket_address (obj :> Raw.Inet_socket_address.t)

    method get_destination_hostname : unit -> string =
      fun () -> Raw.Proxy_address.get_destination_hostname obj

    method get_destination_port : unit -> UInt16.t =
      fun () -> Raw.Proxy_address.get_destination_port obj

    method get_destination_protocol : unit -> string =
      fun () -> Raw.Proxy_address.get_destination_protocol obj

    method get_password : unit -> string option =
      fun () -> Raw.Proxy_address.get_password obj

    method get_protocol : unit -> string =
      fun () -> Raw.Proxy_address.get_protocol obj

    method get_uri : unit -> string option =
      fun () -> Raw.Proxy_address.get_uri obj

    method get_username : unit -> string option =
      fun () -> Raw.Proxy_address.get_username obj

    method as_proxy_address = obj
  end

let new_ (inetaddr : Inet_address.inet_address_t) (port : UInt16.t)
    (protocol : string) (dest_hostname : string) (dest_port : UInt16.t)
    (username : string option) (password : string option) : proxy_address_t =
  let inetaddr = inetaddr#as_inet_address in
  let obj_ =
    Raw.Proxy_address.new_ inetaddr port protocol dest_hostname dest_port
      username password
  in
  new proxy_address obj_
