(** An IPv4 or IPv6 socket address. That is, the combination of a
    [Gio.InetAddress] and a port number.

    In UNIX terms, [GInetSocketAddress] corresponds to a [struct sockaddr_in6]
    or [struct sockaddr_in]).

    Its methods, signals and properties are on
    {!class-type-inet_socket_address_t}. The functions it is built on are in
    {!Ocgio.Raw.Inet_socket_address}. *)

(** The methods, signals and properties of a [GInetSocketAddress]. *)
class type inet_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method get_address : unit -> Inet_address.inet_address_t
  (** Gets [address]'s [GInetAddress]. *)

  method get_flowinfo : unit -> UInt32.t
  (** Gets the [sin6_flowinfo] field from [address], which must be an IPv6
      address.

      If not overridden this value will be inherited from
      [Gio.InetSocketAddress:address]. *)

  method get_port : unit -> UInt16.t
  (** Gets [address]'s port. *)

  method get_scope_id : unit -> UInt32.t
  (** Gets the [sin6_scope_id] field from [address], which must be an IPv6
      address.

      If not overridden this value will be inherited from
      [Gio.InetSocketAddress:address]. *)

  method as_inet_socket_address : Raw.Inet_socket_address.t
end

class inet_socket_address : Raw.Inet_socket_address.t -> inet_socket_address_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Inet_socket_address.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GInetSocketAddress], give one already wrapped. *)

val new_ : Inet_address.inet_address_t -> UInt16.t -> inet_socket_address_t
val new_from_string : string -> int -> inet_socket_address_t
