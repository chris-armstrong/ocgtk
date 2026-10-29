(* GENERATED CODE - DO NOT EDIT *)
(* InetAddress: InetAddress *)

(** [GInetAddress] represents an IPv4 or IPv6 internet address. Use
    [Gio.Resolver.lookup_by_name] or [Gio.Resolver.lookup_by_name_async] to look
    up the [GInetAddress] for a hostname. Use [Gio.Resolver.lookup_by_address]
    or [Gio.Resolver.lookup_by_address_async] to look up the hostname for a
    [GInetAddress].

    To actually connect to a remote host, you will need a
    {{!Ocgio.Raw.Inet_socket_address}[Gio.InetSocketAddress]} (which includes a
    [GInetAddress] as well as a port number).

    The class built on this module is in {!Ocgio.Inet_address}. *)

type t = [ `inet_address | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_inet_address_get_type"

external new_any : Ocgio_enums.socketfamily -> t = "ml_g_inet_address_new_any"
[@@ocaml.doc
  "Creates a [GInetAddress] for the \"any\" address (unassigned/\"don't\n\
   care\") for [family]."]

external new_from_string : string -> t = "ml_g_inet_address_new_from_string"
(** Parses [string] as an IP address and creates a new [GInetAddress].

    If [address] is an IPv6 address, it can also contain a scope ID (separated
    from the address by a [%]). Note that currently this behavior is platform
    specific. This may change in a future release. *)

external new_loopback : Ocgio_enums.socketfamily -> t
  = "ml_g_inet_address_new_loopback"
(** Creates a [GInetAddress] for the loopback address for [family]. *)

(* Methods *)

external to_string : t -> string = "ml_g_inet_address_to_string"
(** Converts [address] to string form. *)

external get_scope_id : t -> UInt32.t = "ml_g_inet_address_get_scope_id"
(** Gets the value of [Gio.InetAddress:scope-id]. *)

external get_native_size : t -> Gsize.t = "ml_g_inet_address_get_native_size"
(** Gets the size of the native raw binary address for [address]. This is the
    size of the data that you get from g_inet_address_to_bytes(). *)

external get_is_site_local : t -> bool = "ml_g_inet_address_get_is_site_local"
(** Tests whether [address] is a site-local address such as 10.0.0.1 (that is,
    the address identifies a host on a local network that can not be reached
    directly from the Internet, but which may have outgoing Internet
    connectivity via a NAT or firewall). *)

external get_is_multicast : t -> bool = "ml_g_inet_address_get_is_multicast"
(** Tests whether [address] is a multicast address. *)

external get_is_mc_site_local : t -> bool
  = "ml_g_inet_address_get_is_mc_site_local"
(** Tests whether [address] is a site-local multicast address. *)

external get_is_mc_org_local : t -> bool
  = "ml_g_inet_address_get_is_mc_org_local"
(** Tests whether [address] is an organization-local multicast address. *)

external get_is_mc_node_local : t -> bool
  = "ml_g_inet_address_get_is_mc_node_local"
(** Tests whether [address] is a node-local multicast address. *)

external get_is_mc_link_local : t -> bool
  = "ml_g_inet_address_get_is_mc_link_local"
(** Tests whether [address] is a link-local multicast address. *)

external get_is_mc_global : t -> bool = "ml_g_inet_address_get_is_mc_global"
(** Tests whether [address] is a global multicast address. *)

external get_is_loopback : t -> bool = "ml_g_inet_address_get_is_loopback"
(** Tests whether [address] is the loopback address for its family. *)

external get_is_link_local : t -> bool = "ml_g_inet_address_get_is_link_local"
(** Tests whether [address] is a link-local address (that is, if it identifies a
    host on a local network that is not connected to the Internet). *)

external get_is_any : t -> bool = "ml_g_inet_address_get_is_any"
[@@ocaml.doc "Tests whether [address] is the \"any\" address for its family."]

external get_flowinfo : t -> UInt32.t = "ml_g_inet_address_get_flowinfo"
(** Gets the value of [Gio.InetAddress:flowinfo]. *)

external get_family : t -> Ocgio_enums.socketfamily
  = "ml_g_inet_address_get_family"
(** Gets [address]'s family *)

external equal : t -> t -> bool = "ml_g_inet_address_equal"
(** Checks if two [GInetAddress] instances are equal, e.g. the same address. *)

(* Properties *)
