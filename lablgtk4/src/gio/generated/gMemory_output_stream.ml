(* High-level class for MemoryOutputStream *)
class memory_output_stream (obj : Memory_output_stream.t) = object (self)

    method as_memory_output_stream = obj
end

