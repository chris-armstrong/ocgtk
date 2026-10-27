(** A [Gio.InetSocketAddress] representing a connection via a proxy server.

    Its methods, signals and properties are on {!class-type-proxy_address_t}.
    The functions it is built on are in {!Ocgio.Raw.Proxy_address}. *)

(** The methods, signals and properties of a [GProxyAddress]. *)
class type proxy_address_t = object
  inherit Inet_socket_address.inet_socket_address_t
  method get_destination_hostname : unit -> string
  method get_destination_port : unit -> UInt16.t
  method get_destination_protocol : unit -> string
  method get_password : unit -> string option
  method get_protocol : unit -> string
  method get_uri : unit -> string option
  method get_username : unit -> string option
  method as_proxy_address : Raw.Proxy_address.t
end

class proxy_address : Raw.Proxy_address.t -> proxy_address_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Proxy_address.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GProxyAddress], give one already wrapped. *)

val new_ :
  Inet_address.inet_address_t ->
  UInt16.t ->
  string ->
  string ->
  UInt16.t ->
  string option ->
  string option ->
  proxy_address_t
