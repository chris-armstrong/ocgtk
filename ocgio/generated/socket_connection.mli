(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for SocketConnection from cyclic group Socket_and__socket_connection *)

(** [GSocketConnection] is a [Gio.IOStream] for a connected socket. They can be
    created either by [Gio.SocketClient] when connecting to a host, or by
    [Gio.SocketListener] when accepting a new client.

    The type of the [GSocketConnection] object returned from these calls depends
    on the type of the underlying socket that is in use. For instance, for a
    TCP/IP connection it will be a [Gio.TcpConnection].

    Choosing what type of object to construct is done with the socket connection
    factory, and it is possible for third parties to register custom socket
    connection types for specific combination of socket family/type/protocol
    using [Gio.SocketConnection.factory_register_type].

    To close a [GSocketConnection], use [Gio.IOStream.close]. Closing both
    substreams of the [Gio.IOStream] separately will not close the underlying
    [Gio.Socket].

    Its methods, signals and properties are on
    {!class-type-socket_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Socket_connection}. *)

class type socket_connection_t =
  Socket_and__socket_connection.socket_connection_t
(** The methods, signals and properties of a [GSocketConnection]. *)

class socket_connection : Raw.Socket_connection.t -> socket_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSocketConnection], give one already wrapped. *)
