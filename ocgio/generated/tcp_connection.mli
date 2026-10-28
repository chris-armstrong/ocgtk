(** This is the subclass of [Gio.SocketConnection] that is created for TCP/IP
    sockets.

    Its methods, signals and properties are on {!class-type-tcp_connection_t}.
    The functions it is built on are in {!Ocgio.Raw.Tcp_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TcpConnection].}

    Inherits from:
    {{!Ocgio.Socket_connection.class-type-socket_connection_t}Ocgio.Socket_connection}

    This is the subclass of [Gio.SocketConnection] that is created for TCP/IP
    sockets. *)
class type tcp_connection_t = object
  inherit Socket_and__socket_connection.socket_connection_t

  (** {2:methods Methods} *)

  method get_graceful_disconnect : unit -> bool
  (** Checks if graceful disconnects are used. See
      g_tcp_connection_set_graceful_disconnect(). *)

  method set_graceful_disconnect : bool -> unit
  (** This enables graceful disconnects on close. A graceful disconnect means
      that we signal the receiving end that the connection is terminated and
      wait for it to close the connection before closing the connection.

      A graceful disconnect means that we can be sure that we successfully sent
      all the outstanding data to the other end, or get an error reported.
      However, it also means we have to wait for all the data to reach the other
      side and for it to acknowledge this by closing the socket, which may take
      a while. For this reason it is disabled by default. *)

  (** {2:conversions Conversions} *)

  method as_tcp_connection : Raw.Tcp_connection.t
end

class tcp_connection : Raw.Tcp_connection.t -> tcp_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Tcp_connection.t}. *)
