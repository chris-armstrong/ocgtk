class type unix_input_stream_t = object
    inherit GInput_stream.input_stream_t
    method get_close_fd : unit -> bool
    method get_fd : unit -> int
    method set_close_fd : bool -> unit
    method as_unix_input_stream : Unix_input_stream.t
end

class unix_input_stream : Unix_input_stream.t -> unix_input_stream_t

