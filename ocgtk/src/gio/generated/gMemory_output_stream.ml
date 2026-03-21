class type memory_output_stream_t = object
    method as_memory_output_stream : Memory_output_stream.t
end

(* High-level class for MemoryOutputStream *)
class memory_output_stream (obj : Memory_output_stream.t) : memory_output_stream_t = object (self)

    method as_memory_output_stream = obj
end

