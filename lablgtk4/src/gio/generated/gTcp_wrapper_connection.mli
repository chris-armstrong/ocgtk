class tcp_wrapper_connection : Tcp_wrapper_connection.t ->
  object
    method get_base_io_stream : unit -> GIo_stream.io_stream
    method as_tcp_wrapper_connection : Tcp_wrapper_connection.t
  end

