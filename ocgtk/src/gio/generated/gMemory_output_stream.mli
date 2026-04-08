class type memory_output_stream_t = object
    inherit GOutput_stream.output_stream_t
    method steal_as_bytes : unit -> Glib_bytes.t
    method as_memory_output_stream : Memory_output_stream.t
end

class memory_output_stream : Memory_output_stream.t -> memory_output_stream_t

val new_resizable : unit -> memory_output_stream_t
