class type memory_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t
  inherit Seekable.seekable_t
  method add_bytes : Glib_bytes.t -> unit
  method as_memory_input_stream : Raw.Memory_input_stream.t
end

class memory_input_stream : Raw.Memory_input_stream.t -> memory_input_stream_t

val new_ : unit -> memory_input_stream_t
val new_from_bytes : Glib_bytes.t -> memory_input_stream_t
