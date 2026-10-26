class type tcp_connection_t = object
  inherit GSocket_and__socket_connection.socket_connection_t
  method get_graceful_disconnect : unit -> bool
  method set_graceful_disconnect : bool -> unit
  method as_tcp_connection : Tcp_connection.t
end

class tcp_connection : Tcp_connection.t -> tcp_connection_t
