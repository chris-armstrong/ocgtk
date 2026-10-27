(** Like [Gio.NetworkAddress] does with hostnames, [GNetworkService] provides an
    easy way to resolve a SRV record, and then attempt to connect to one of the
    hosts that implements that service, handling service priority/weighting,
    multiple IP addresses, and multiple address families.

    See [Gio.SrvTarget] for more information about SRV records, and see
    [Gio.SocketConnectable] for an example of using the connectable interface.

    Its methods, signals and properties are on {!class-type-network_service_t}.
    The functions it is built on are in {!Ocgio.Raw.Network_service}. *)

(** The methods, signals and properties of a [GNetworkService]. *)
class type network_service_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_domain : unit -> string
  method get_protocol : unit -> string
  method get_scheme : unit -> string
  method get_service : unit -> string
  method set_scheme : string -> unit
  method as_network_service : Raw.Network_service.t
end

class network_service : Raw.Network_service.t -> network_service_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Network_service.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GNetworkService], give one already wrapped. *)

val new_ : string -> string -> string -> network_service_t
