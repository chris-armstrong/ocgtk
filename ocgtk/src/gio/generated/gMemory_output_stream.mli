class type memory_output_stream_t = object
    method as_memory_output_stream : Memory_output_stream.t
end

class memory_output_stream : Memory_output_stream.t -> memory_output_stream_t

