class type unix_output_stream_t = object
    method get_close_fd : unit -> bool
    method get_fd : unit -> int
    method set_close_fd : bool -> unit
    method as_unix_output_stream : Unix_output_stream.t
end

class unix_output_stream : Unix_output_stream.t -> unix_output_stream_t

