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

(* High-level class for TcpConnection *)
class tcp_connection (obj : Raw.Tcp_connection.t) : tcp_connection_t =
  object (self)
    inherit
      Socket_and__socket_connection.socket_connection
        (obj :> Raw.Socket_connection.t)

    method get_graceful_disconnect : unit -> bool =
      fun () -> Raw.Tcp_connection.get_graceful_disconnect obj

    method set_graceful_disconnect : bool -> unit =
      fun graceful_disconnect ->
        Raw.Tcp_connection.set_graceful_disconnect obj graceful_disconnect

    method as_tcp_connection = obj
  end
