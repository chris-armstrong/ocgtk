(** This is the subclass of [Gio.SocketConnection] that is created for TCP/IP
    sockets.

    Its methods, signals and properties are on {!class-type-tcp_connection_t}.
    The functions it is built on are in {!Ocgio.Raw.Tcp_connection}. *)

(** The methods, signals and properties of a [GTcpConnection]. *)
class type tcp_connection_t = object
  inherit Socket_and__socket_connection.socket_connection_t
  method get_graceful_disconnect : unit -> bool
  method set_graceful_disconnect : bool -> unit
  method as_tcp_connection : Raw.Tcp_connection.t
end

class tcp_connection : Raw.Tcp_connection.t -> tcp_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tcp_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GTcpConnection], give one already wrapped. *)
