(** [GInetAddress] represents an IPv4 or IPv6 internet address. Use
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_name}[Gio.Resolver.lookup_by_name]}
    or [Gio.Resolver.lookup_by_name_async] to look up the [GInetAddress] for a
    hostname. Use
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_address}[Gio.Resolver.lookup_by_address]}
    or [Gio.Resolver.lookup_by_address_async] to look up the hostname for a
    [GInetAddress].

    Its methods, signals and properties are on {!class-type-inet_address_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Inet_address}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [InetAddress].}

    [GInetAddress] represents an IPv4 or IPv6 internet address. Use
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_name}[Gio.Resolver.lookup_by_name]}
    or [Gio.Resolver.lookup_by_name_async] to look up the [GInetAddress] for a
    hostname. Use
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_address}[Gio.Resolver.lookup_by_address]}
    or [Gio.Resolver.lookup_by_address_async] to look up the hostname for a
    [GInetAddress].

    To actually connect to a remote host, you will need a
    {{!Ocgio.Inet_socket_address.class-type-inet_socket_address_t}[Gio.InetSocketAddress]}
    (which includes a [GInetAddress] as well as a port number). *)
class type inet_address_t = object
  (** {2:methods Methods} *)

  method equal : inet_address_t -> bool
  (** Checks if two [GInetAddress] instances are equal, e.g. the same address.
  *)

  method get_family : unit -> Enums.socketfamily
  (** Gets [address]'s family *)

  method get_flowinfo : unit -> UInt32.t
  (** Gets the value of [Gio.InetAddress:flowinfo]. *)

  method get_is_any : unit -> bool
  [@@ocaml.doc "Tests whether [address] is the \"any\" address for its family."]

  method get_is_link_local : unit -> bool
  (** Tests whether [address] is a link-local address (that is, if it identifies
      a host on a local network that is not connected to the Internet). *)

  method get_is_loopback : unit -> bool
  (** Tests whether [address] is the loopback address for its family. *)

  method get_is_mc_global : unit -> bool
  (** Tests whether [address] is a global multicast address. *)

  method get_is_mc_link_local : unit -> bool
  (** Tests whether [address] is a link-local multicast address. *)

  method get_is_mc_node_local : unit -> bool
  (** Tests whether [address] is a node-local multicast address. *)

  method get_is_mc_org_local : unit -> bool
  (** Tests whether [address] is an organization-local multicast address. *)

  method get_is_mc_site_local : unit -> bool
  (** Tests whether [address] is a site-local multicast address. *)

  method get_is_multicast : unit -> bool
  (** Tests whether [address] is a multicast address. *)

  method get_is_site_local : unit -> bool
  (** Tests whether [address] is a site-local address such as 10.0.0.1 (that is,
      the address identifies a host on a local network that can not be reached
      directly from the Internet, but which may have outgoing Internet
      connectivity via a NAT or firewall). *)

  method get_native_size : unit -> Gsize.t
  (** Gets the size of the native raw binary address for [address]. This is the
      size of the data that you get from [g_inet_address_to_bytes ()]. *)

  method get_scope_id : unit -> UInt32.t
  (** Gets the value of [Gio.InetAddress:scope-id]. *)

  method to_string : unit -> string
  (** Converts [address] to string form. *)

  (** {2:conversions Conversions} *)

  method as_inet_address : Raw.Inet_address.t
end

class inet_address : Raw.Inet_address.t -> inet_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Inet_address.t}. *)

(** {1:description Description}

    [GInetAddress] represents an IPv4 or IPv6 internet address. Use
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_name}[Gio.Resolver.lookup_by_name]}
    or [Gio.Resolver.lookup_by_name_async] to look up the [GInetAddress] for a
    hostname. Use
    {{!Ocgio.Resolver.class-type-resolver_t.method-lookup_by_address}[Gio.Resolver.lookup_by_address]}
    or [Gio.Resolver.lookup_by_address_async] to look up the hostname for a
    [GInetAddress].

    To actually connect to a remote host, you will need a
    {{!Ocgio.Inet_socket_address.class-type-inet_socket_address_t}[Gio.InetSocketAddress]}
    (which includes a [GInetAddress] as well as a port number). *)

(** {1:constructors Constructors} *)

val new_any : Enums.socketfamily -> inet_address_t
[@@ocaml.doc
  "Creates a {{!Ocgio.Inet_address.class-type-inet_address_t}[GInetAddress]} \
   for the \"any\" address (unassigned/\"don't\n\
   care\") for [family]."]

val new_from_string : string -> inet_address_t
(** Parses [string] as an IP address and creates a new
    {{!Ocgio.Inet_address.class-type-inet_address_t}[GInetAddress]}.

    If [address] is an IPv6 address, it can also contain a scope ID (separated
    from the address by a [%]). Note that currently this behavior is platform
    specific. This may change in a future release. *)

val new_loopback : Enums.socketfamily -> inet_address_t
(** Creates a {{!Ocgio.Inet_address.class-type-inet_address_t}[GInetAddress]}
    for the loopback address for [family]. *)
