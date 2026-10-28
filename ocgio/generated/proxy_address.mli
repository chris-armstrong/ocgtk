(** A [Gio.InetSocketAddress] representing a connection via a proxy server.

    Its methods, signals and properties are on {!class-type-proxy_address_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Proxy_address}. *)

(** {b The methods, signals and properties of a [ProxyAddress].}

    A [Gio.InetSocketAddress] representing a connection via a proxy server. *)
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

class proxy_address : Raw.Proxy_address.t -> proxy_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Proxy_address.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Inet_address.inet_address_t ->
  UInt16.t ->
  string ->
  string ->
  UInt16.t ->
  string option ->
  string option ->
  proxy_address_t
(** Creates a new [GProxyAddress] for [inetaddr] with [protocol] that should
    tunnel through [dest_hostname] and [dest_port].

    (Note that this method doesn't set the [GProxyAddress:uri] or
    [GProxyAddress:destination]-protocol fields; use g_object_new() directly if
    you want to set those.) *)
