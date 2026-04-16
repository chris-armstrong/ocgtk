class type unix_output_stream_t = object
  inherit GOutput_stream.output_stream_t
  inherit GFile_descriptor_based.file_descriptor_based_t
  inherit GPollable_output_stream.pollable_output_stream_t
  method get_close_fd : unit -> bool
  method set_close_fd : bool -> unit
  method as_unix_output_stream : Unix_output_stream.t
end

class unix_output_stream : Unix_output_stream.t -> unix_output_stream_t

val new_ : int -> bool -> unix_output_stream_t
