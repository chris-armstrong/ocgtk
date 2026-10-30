(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for SocketConnection from cyclic group Socket_and__socket_connection *)

(** [GSocketConnection] is a
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} for a connected
    socket. They can be created either by
    {{!Ocgio.Socket_client.class-type-socket_client_t}[Gio.SocketClient]} when
    connecting to a host, or by
    {{!Ocgio.Socket_listener.class-type-socket_listener_t}[Gio.SocketListener]}
    when accepting a new client.

    Its methods, signals and properties are on
    {!class-type-socket_connection_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Socket_connection}. *)

(** {1:class Class} *)

class type socket_connection_t =
  Socket_and__socket_connection.socket_connection_t
(** {b The methods, signals and properties of a [SocketConnection].}

    Inherits from: {{!Ocgio.Io_stream.class-type-io_stream_t}Ocgio.Io_stream}

    [GSocketConnection] is a
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} for a connected
    socket. They can be created either by
    {{!Ocgio.Socket_client.class-type-socket_client_t}[Gio.SocketClient]} when
    connecting to a host, or by
    {{!Ocgio.Socket_listener.class-type-socket_listener_t}[Gio.SocketListener]}
    when accepting a new client.

    The type of the [GSocketConnection] object returned from these calls depends
    on the type of the underlying socket that is in use. For instance, for a
    TCP/IP connection it will be a
    {{!Ocgio.Tcp_connection.class-type-tcp_connection_t}[Gio.TcpConnection]}.

    Choosing what type of object to construct is done with the socket connection
    factory, and it is possible for third parties to register custom socket
    connection types for specific combination of socket family/type/protocol
    using [Gio.SocketConnection.factory_register_type].

    To close a [GSocketConnection], use
    {{!Ocgio.Io_stream.class-type-io_stream_t.method-close}[Gio.IOStream.close]}.
    Closing both substreams of the
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} separately will
    not close the underlying {{!Ocgio.Socket.class-type-socket_t}[Gio.Socket]}.
*)

class socket_connection : Raw.Socket_connection.t -> socket_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_connection.t}. *)

(** {1:description Description}

    [GSocketConnection] is a
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} for a connected
    socket. They can be created either by
    {{!Ocgio.Socket_client.class-type-socket_client_t}[Gio.SocketClient]} when
    connecting to a host, or by
    {{!Ocgio.Socket_listener.class-type-socket_listener_t}[Gio.SocketListener]}
    when accepting a new client.

    The type of the [GSocketConnection] object returned from these calls depends
    on the type of the underlying socket that is in use. For instance, for a
    TCP/IP connection it will be a
    {{!Ocgio.Tcp_connection.class-type-tcp_connection_t}[Gio.TcpConnection]}.

    Choosing what type of object to construct is done with the socket connection
    factory, and it is possible for third parties to register custom socket
    connection types for specific combination of socket family/type/protocol
    using [Gio.SocketConnection.factory_register_type].

    To close a [GSocketConnection], use
    {{!Ocgio.Io_stream.class-type-io_stream_t.method-close}[Gio.IOStream.close]}.
    Closing both substreams of the
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} separately will
    not close the underlying {{!Ocgio.Socket.class-type-socket_t}[Gio.Socket]}.
*)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
