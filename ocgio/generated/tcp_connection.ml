class type tcp_connection_t = object
  inherit Socket_and__socket_connection.socket_connection_t
  method get_graceful_disconnect : unit -> bool
  method set_graceful_disconnect : bool -> unit
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
