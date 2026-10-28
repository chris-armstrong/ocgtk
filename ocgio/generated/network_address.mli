(** [GNetworkAddress] provides an easy way to resolve a hostname and then
    attempt to connect to that host, handling the possibility of multiple IP
    addresses and multiple address families.

    Its methods, signals and properties are on {!class-type-network_address_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Network_address}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NetworkAddress].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}Ocgio.Socket_connectable}

    [GNetworkAddress] provides an easy way to resolve a hostname and then
    attempt to connect to that host, handling the possibility of multiple IP
    addresses and multiple address families.

    The enumeration results of resolved addresses {i may} be cached as long as
    this object is kept alive which may have unexpected results if alive for too
    long.

    See [Gio.SocketConnectable] for an example of using the connectable
    interface. *)
class type network_address_t = object
  inherit Socket_connectable.socket_connectable_t

  (** {2:methods Methods} *)

  method get_hostname : unit -> string
  (** Gets [addr]'s hostname. This might be either UTF-8 or ASCII-encoded,
      depending on what [addr] was created with. *)

  method get_port : unit -> UInt16.t
  (** Gets [addr]'s port number *)

  method get_scheme : unit -> string option
  (** Gets [addr]'s scheme *)

  (** {2:conversions Conversions} *)

  method as_network_address : Raw.Network_address.t
end

class network_address : Raw.Network_address.t -> network_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Network_address.t}. *)

(** {1:description Description}

    [GNetworkAddress] provides an easy way to resolve a hostname and then
    attempt to connect to that host, handling the possibility of multiple IP
    addresses and multiple address families.

    The enumeration results of resolved addresses {i may} be cached as long as
    this object is kept alive which may have unexpected results if alive for too
    long.

    See [Gio.SocketConnectable] for an example of using the connectable
    interface. *)

(** {1:constructors Constructors} *)

val new_ : string -> UInt16.t -> network_address_t
(** Creates a new [GSocketConnectable] for connecting to the given [hostname]
    and [port].

    Note that depending on the configuration of the machine, a [hostname] of
    [localhost] may refer to the IPv4 loopback address only, or to both IPv4 and
    IPv6; use g_network_address_new_loopback() to create a [GNetworkAddress]
    that is guaranteed to resolve to both addresses. *)

val new_loopback : UInt16.t -> network_address_t
(** Creates a new [GSocketConnectable] for connecting to the local host over a
    loopback connection to the given [port]. This is intended for use in
    connecting to local services which may be running on IPv4 or IPv6.

    The connectable will return IPv4 and IPv6 loopback addresses, regardless of
    how the host resolves [localhost]. By contrast, g_network_address_new() will
    often only return an IPv4 address when resolving [localhost], and an IPv6
    address for [localhost6].

    g_network_address_get_hostname() will always return [localhost] for a
    [GNetworkAddress] created with this constructor. *)
