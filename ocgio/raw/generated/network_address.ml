(* GENERATED CODE - DO NOT EDIT *)
(* NetworkAddress: NetworkAddress *)

(** [GNetworkAddress] provides an easy way to resolve a hostname and then
    attempt to connect to that host, handling the possibility of multiple IP
    addresses and multiple address families.

    The enumeration results of resolved addresses {i may} be cached as long as
    this object is kept alive which may have unexpected results if alive for too
    long.

    See {{!Ocgio.Raw.Socket_connectable}[Gio.SocketConnectable]} for an example
    of using the connectable interface.

    The class built on this module is in {!Ocgio.Network_address}. *)

type t = [ `network_address | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_network_address_get_type"

external new_ : string -> UInt16.t -> t = "ml_g_network_address_new"
(** Creates a new [GSocketConnectable] for connecting to the given [hostname]
    and [port].

    Note that depending on the configuration of the machine, a [hostname] of
    [localhost] may refer to the IPv4 loopback address only, or to both IPv4 and
    IPv6; use g_network_address_new_loopback() to create a [GNetworkAddress]
    that is guaranteed to resolve to both addresses. *)

external new_loopback : UInt16.t -> t = "ml_g_network_address_new_loopback"
(** Creates a new [GSocketConnectable] for connecting to the local host over a
    loopback connection to the given [port]. This is intended for use in
    connecting to local services which may be running on IPv4 or IPv6.

    The connectable will return IPv4 and IPv6 loopback addresses, regardless of
    how the host resolves [localhost]. By contrast, g_network_address_new() will
    often only return an IPv4 address when resolving [localhost], and an IPv6
    address for [localhost6].

    g_network_address_get_hostname() will always return [localhost] for a
    [GNetworkAddress] created with this constructor. *)

(* Methods *)

external get_scheme : t -> string option = "ml_g_network_address_get_scheme"
(** Gets [addr]'s scheme *)

external get_port : t -> UInt16.t = "ml_g_network_address_get_port"
(** Gets [addr]'s port number *)

external get_hostname : t -> string = "ml_g_network_address_get_hostname"
(** Gets [addr]'s hostname. This might be either UTF-8 or ASCII-encoded,
    depending on what [addr] was created with. *)

(* Properties *)
