(* High-level class for TcpConnection *)
class tcp_connection (obj : Tcp_connection.t) = object (self)

  method get_graceful_disconnect : unit -> bool =
    fun () ->
      (Tcp_connection.get_graceful_disconnect obj)

  method set_graceful_disconnect : bool -> unit =
    fun graceful_disconnect ->
      (Tcp_connection.set_graceful_disconnect obj graceful_disconnect)

    method as_tcp_connection = obj
end

