(* High-level class for TcpWrapperConnection *)
class tcp_wrapper_connection (obj : Tcp_wrapper_connection.t) = object (self)

  method get_base_io_stream : unit -> GIo_stream.io_stream =
    fun () ->
      new  GIo_stream.io_stream(Tcp_wrapper_connection.get_base_io_stream obj)

    method as_tcp_wrapper_connection = obj
end

