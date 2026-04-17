class type unix_input_stream_t = object
    inherit GInput_stream.input_stream_t
    inherit GFile_descriptor_based.file_descriptor_based_t
    inherit GPollable_input_stream.pollable_input_stream_t
    method get_close_fd : unit -> bool
    method set_close_fd : bool -> unit
    method as_unix_input_stream : Unix_input_stream.t
end

class unix_input_stream : Unix_input_stream.t -> unix_input_stream_t

val new_ : int -> bool -> unix_input_stream_t
