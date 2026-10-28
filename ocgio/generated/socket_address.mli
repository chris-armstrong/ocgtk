(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for SocketAddress from cyclic group Socket_address_and__socket_address_enumerator_and__socket_connectable *)

(** [GSocketAddress] is the equivalent of [struct sockaddr]) and its subtypes in
    the BSD sockets API. This is an abstract class; use [Gio.InetSocketAddress]
    for internet sockets, or [Gio.UnixSocketAddress] for UNIX domain sockets.

    Its methods, signals and properties are on {!class-type-socket_address_t}.
    The functions it is built on are in {!Ocgio.Raw.Socket_address}. *)

(** {1:class Class} *)

class type socket_address_t =
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .socket_address_t
(** {b The methods, signals and properties of a [SocketAddress].}

    [GSocketAddress] is the equivalent of [struct sockaddr]) and its subtypes in
    the BSD sockets API. This is an abstract class; use [Gio.InetSocketAddress]
    for internet sockets, or [Gio.UnixSocketAddress] for UNIX domain sockets. *)

class socket_address : Raw.Socket_address.t -> socket_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_address.t}. *)
