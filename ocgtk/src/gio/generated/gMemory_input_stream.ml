class type memory_input_stream_t = object
    method as_memory_input_stream : Memory_input_stream.t
end

(* High-level class for MemoryInputStream *)
class memory_input_stream (obj : Memory_input_stream.t) : memory_input_stream_t = object (self)

    method as_memory_input_stream = obj
end

