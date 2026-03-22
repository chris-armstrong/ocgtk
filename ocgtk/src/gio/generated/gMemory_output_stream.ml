class type memory_output_stream_t = object
    inherit GOutput_stream.output_stream_t
    method as_memory_output_stream : Memory_output_stream.t
end

(* High-level class for MemoryOutputStream *)
class memory_output_stream (obj : Memory_output_stream.t) : memory_output_stream_t = object (self)
  inherit GOutput_stream.output_stream (Obj.magic obj : Output_stream.t)

    method as_memory_output_stream = obj
end

