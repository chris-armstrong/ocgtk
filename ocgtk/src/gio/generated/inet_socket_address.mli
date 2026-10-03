(* GENERATED CODE - DO NOT EDIT *)
(* InetSocketAddress: InetSocketAddress *)

(** An IPv4 or IPv6 socket address. That is, the combination of a
    [Gio.InetAddress] and a port number.

    In UNIX terms, [GInetSocketAddress] corresponds to a [struct sockaddr_in6]
    or [struct sockaddr_in]). *)

type t = [ `inet_socket_address | `socket_address | `object_ ] Gobject.obj

external new_ : Inet_address.t -> UInt16.t -> t = "ml_g_inet_socket_address_new"
(** Create a new InetSocketAddress *)

external new_from_string : string -> int -> t
  = "ml_g_inet_socket_address_new_from_string"
(** Create a new InetSocketAddress *)

(* Methods *)

external get_scope_id : t -> UInt32.t = "ml_g_inet_socket_address_get_scope_id"
(** Gets the [sin6_scope_id] field from [address], which must be an IPv6
    address.

    If not overridden this value will be inherited from
    [Gio.InetSocketAddress:address]. *)

external get_port : t -> UInt16.t = "ml_g_inet_socket_address_get_port"
(** Gets [address]'s port. *)

external get_flowinfo : t -> UInt32.t = "ml_g_inet_socket_address_get_flowinfo"
(** Gets the [sin6_flowinfo] field from [address], which must be an IPv6
    address.

    If not overridden this value will be inherited from
    [Gio.InetSocketAddress:address]. *)

external get_address : t -> Inet_address.t
  = "ml_g_inet_socket_address_get_address"
(** Gets [address]'s [GInetAddress]. *)

(* Properties *)
