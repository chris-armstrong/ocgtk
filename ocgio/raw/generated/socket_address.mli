(* GENERATED CODE - DO NOT EDIT *)
(* SocketAddress, a member of the cyclic module Socket_address_and__socket_address_enumerator_and__socket_connectable *)

(** [GSocketAddress] is the equivalent of [struct sockaddr]) and its subtypes in
    the BSD sockets API. This is an abstract class; use
    {{!Ocgio.Raw.Inet_socket_address}[Gio.InetSocketAddress]} for internet
    sockets, or {{!Ocgio.Raw.Unix_socket_address}[Gio.UnixSocketAddress]} for
    UNIX domain sockets.

    The class built on this module is in {!Ocgio.Socket_address}. *)

include module type of struct
  include
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .Socket_address
end
