class type tcp_wrapper_connection_t = object
  inherit GTcp_connection.tcp_connection_t
  method get_base_io_stream : unit -> GIo_stream.io_stream_t
  method as_tcp_wrapper_connection : Tcp_wrapper_connection.t
end

class tcp_wrapper_connection :
  Tcp_wrapper_connection.t ->
  tcp_wrapper_connection_t

val new_ :
  GIo_stream.io_stream_t ->
  GSocket_and__socket_connection.socket_t ->
  tcp_wrapper_connection_t
