(** [GInetAddress] represents an IPv4 or IPv6 internet address. Use
    [Gio.Resolver.lookup_by_name] or [Gio.Resolver.lookup_by_name_async] to look
    up the [GInetAddress] for a hostname. Use [Gio.Resolver.lookup_by_address]
    or [Gio.Resolver.lookup_by_address_async] to look up the hostname for a
    [GInetAddress].

    To actually connect to a remote host, you will need a
    [Gio.InetSocketAddress] (which includes a [GInetAddress] as well as a port
    number).

    Its methods, signals and properties are on {!class-type-inet_address_t}. The
    functions it is built on are in {!Ocgio.Raw.Inet_address}. *)

(** The methods, signals and properties of a [GInetAddress]. *)
class type inet_address_t = object
  method equal : inet_address_t -> bool
  method get_family : unit -> Enums.socketfamily
  method get_flowinfo : unit -> UInt32.t
  method get_is_any : unit -> bool
  method get_is_link_local : unit -> bool
  method get_is_loopback : unit -> bool
  method get_is_mc_global : unit -> bool
  method get_is_mc_link_local : unit -> bool
  method get_is_mc_node_local : unit -> bool
  method get_is_mc_org_local : unit -> bool
  method get_is_mc_site_local : unit -> bool
  method get_is_multicast : unit -> bool
  method get_is_site_local : unit -> bool
  method get_native_size : unit -> Gsize.t
  method get_scope_id : unit -> UInt32.t
  method to_string : unit -> string
  method as_inet_address : Raw.Inet_address.t
end

class inet_address : Raw.Inet_address.t -> inet_address_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Inet_address.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GInetAddress], give one already wrapped. *)

val new_any : Enums.socketfamily -> inet_address_t
val new_from_string : string -> inet_address_t
val new_loopback : Enums.socketfamily -> inet_address_t
