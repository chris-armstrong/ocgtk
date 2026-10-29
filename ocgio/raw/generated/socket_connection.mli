(* GENERATED CODE - DO NOT EDIT *)
(* SocketConnection, a member of the cyclic module Socket_and__socket_connection *)

(** [GSocketConnection] is a {{!Ocgio.Raw.Io_stream}[Gio.IOStream]} for a
    connected socket. They can be created either by
    {{!Ocgio.Raw.Socket_client}[Gio.SocketClient]} when connecting to a host, or
    by {{!Ocgio.Raw.Socket_listener}[Gio.SocketListener]} when accepting a new
    client.

    The type of the [GSocketConnection] object returned from these calls depends
    on the type of the underlying socket that is in use. For instance, for a
    TCP/IP connection it will be a
    {{!Ocgio.Raw.Tcp_connection}[Gio.TcpConnection]}.

    Choosing what type of object to construct is done with the socket connection
    factory, and it is possible for third parties to register custom socket
    connection types for specific combination of socket family/type/protocol
    using [Gio.SocketConnection.factory_register_type].

    To close a [GSocketConnection], use [Gio.IOStream.close]. Closing both
    substreams of the {{!Ocgio.Raw.Io_stream}[Gio.IOStream]} separately will not
    close the underlying {{!Ocgio.Raw.Socket}[Gio.Socket]}.

    The class built on this module is in {!Ocgio.Socket_connection}. *)

include module type of struct
  include Socket_and__socket_connection.Socket_connection
end
