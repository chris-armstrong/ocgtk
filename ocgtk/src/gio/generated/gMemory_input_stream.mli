class type memory_input_stream_t = object
    inherit GInput_stream.input_stream_t
    method as_memory_input_stream : Memory_input_stream.t
end

class memory_input_stream : Memory_input_stream.t -> memory_input_stream_t

