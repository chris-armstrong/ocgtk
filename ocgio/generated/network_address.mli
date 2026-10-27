(** [GNetworkAddress] provides an easy way to resolve a hostname and then
    attempt to connect to that host, handling the possibility of multiple IP
    addresses and multiple address families.

    The enumeration results of resolved addresses {i may} be cached as long as
    this object is kept alive which may have unexpected results if alive for too
    long.

    See [Gio.SocketConnectable] for an example of using the connectable
    interface.

    Its methods, signals and properties are on {!class-type-network_address_t}.
    The functions it is built on are in {!Ocgio.Raw.Network_address}. *)

(** The methods, signals and properties of a [GNetworkAddress]. *)
class type network_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_hostname : unit -> string
  method get_port : unit -> UInt16.t
  method get_scheme : unit -> string option
  method as_network_address : Raw.Network_address.t
end

class network_address : Raw.Network_address.t -> network_address_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Network_address.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GNetworkAddress], give one already wrapped. *)

val new_ : string -> UInt16.t -> network_address_t
val new_loopback : UInt16.t -> network_address_t
