class type tcp_wrapper_connection_t = object
    inherit GTcp_connection.tcp_connection_t
    method get_base_io_stream : unit -> GIo_stream.io_stream_t
    method as_tcp_wrapper_connection : Tcp_wrapper_connection.t
end

(* High-level class for TcpWrapperConnection *)
class tcp_wrapper_connection (obj : Tcp_wrapper_connection.t) : tcp_wrapper_connection_t = object (self)
  inherit GTcp_connection.tcp_connection (Obj.magic obj : Tcp_connection.t)

  method get_base_io_stream : unit -> GIo_stream.io_stream_t =
    fun () ->
      new  GIo_stream.io_stream(Tcp_wrapper_connection.get_base_io_stream obj)

    method as_tcp_wrapper_connection = obj
end

