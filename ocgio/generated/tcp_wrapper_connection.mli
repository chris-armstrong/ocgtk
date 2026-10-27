(** A [GTcpWrapperConnection] can be used to wrap a [Gio.IOStream] that is based
    on a [Gio.Socket], but which is not actually a [Gio.SocketConnection]. This
    is used by [Gio.SocketClient] so that it can always return a
    [Gio.SocketConnection], even when the connection it has actually created is
    not directly a [Gio.SocketConnection].

    Its methods, signals and properties are on
    {!class-type-tcp_wrapper_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Tcp_wrapper_connection}. *)

(** The methods, signals and properties of a [GTcpWrapperConnection]. *)
class type tcp_wrapper_connection_t = object
  inherit Tcp_connection.tcp_connection_t

  method get_base_io_stream : unit -> Io_stream.io_stream_t
  (** Gets [conn]'s base [GIOStream] *)

  method as_tcp_wrapper_connection : Raw.Tcp_wrapper_connection.t
end

class tcp_wrapper_connection :
  Raw.Tcp_wrapper_connection.t ->
  tcp_wrapper_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tcp_wrapper_connection.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GTcpWrapperConnection], give one already wrapped. *)

val new_ :
  Io_stream.io_stream_t ->
  Socket_and__socket_connection.socket_t ->
  tcp_wrapper_connection_t
