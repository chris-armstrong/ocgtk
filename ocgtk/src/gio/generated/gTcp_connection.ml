class type tcp_connection_t = object
    method get_graceful_disconnect : unit -> bool
    method set_graceful_disconnect : bool -> unit
    method as_tcp_connection : Tcp_connection.t
end

(* High-level class for TcpConnection *)
class tcp_connection (obj : Tcp_connection.t) : tcp_connection_t = object (self)

  method get_graceful_disconnect : unit -> bool =
    fun () ->
      (Tcp_connection.get_graceful_disconnect obj)

  method set_graceful_disconnect : bool -> unit =
    fun graceful_disconnect ->
      (Tcp_connection.set_graceful_disconnect obj graceful_disconnect)

    method as_tcp_connection = obj
end

