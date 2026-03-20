class type memory_input_stream_t = object
    method as_memory_input_stream : Memory_input_stream.t
end

class memory_input_stream : Memory_input_stream.t -> memory_input_stream_t

