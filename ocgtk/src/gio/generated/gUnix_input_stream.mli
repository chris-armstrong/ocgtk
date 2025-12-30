class unix_input_stream : Unix_input_stream.t ->
  object
    method get_close_fd : unit -> bool
    method get_fd : unit -> int
    method set_close_fd : bool -> unit
    method as_unix_input_stream : Unix_input_stream.t
  end

