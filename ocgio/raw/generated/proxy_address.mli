(* GENERATED CODE - DO NOT EDIT *)
(* ProxyAddress: ProxyAddress *)

(** A [Gio.InetSocketAddress] representing a connection via a proxy server.

    The class built on this module is in {!Ocgio.Proxy_address}. *)

type t =
  [ `proxy_address | `inet_socket_address | `socket_address | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_proxy_address_get_type"

external new_ :
  Inet_address.t ->
  UInt16.t ->
  string ->
  string ->
  UInt16.t ->
  string option ->
  string option ->
  t = "ml_g_proxy_address_new_bytecode" "ml_g_proxy_address_new_native"
(** Creates a new [GProxyAddress] for [inetaddr] with [protocol] that should
    tunnel through [dest_hostname] and [dest_port].

    (Note that this method doesn't set the [GProxyAddress:uri] or
    [GProxyAddress:destination]-protocol fields; use g_object_new() directly if
    you want to set those.) *)

(* Methods *)

external get_username : t -> string option = "ml_g_proxy_address_get_username"
(** Gets [proxy]'s username. *)

external get_uri : t -> string option = "ml_g_proxy_address_get_uri"
(** Gets the proxy URI that [proxy] was constructed from. *)

external get_protocol : t -> string = "ml_g_proxy_address_get_protocol"
[@@ocaml.doc "Gets [proxy]'s protocol. eg, \"socks\" or \"http\""]

external get_password : t -> string option = "ml_g_proxy_address_get_password"
(** Gets [proxy]'s password. *)

external get_destination_protocol : t -> string
  = "ml_g_proxy_address_get_destination_protocol"
[@@ocaml.doc
  "Gets the protocol that is being spoken to the destination\n\
   server; eg, \"http\" or \"ftp\"."]

external get_destination_port : t -> UInt16.t
  = "ml_g_proxy_address_get_destination_port"
(** Gets [proxy]'s destination port; that is, the port on the destination host
    that will be connected to via the proxy, not the port number of the proxy
    itself. *)

external get_destination_hostname : t -> string
  = "ml_g_proxy_address_get_destination_hostname"
(** Gets [proxy]'s destination hostname; that is, the name of the host that will
    be connected to via the proxy, not the name of the proxy itself. *)

(* Properties *)
