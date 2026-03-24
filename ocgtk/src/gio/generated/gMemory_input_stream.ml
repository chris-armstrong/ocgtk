class type memory_input_stream_t = object
    inherit GInput_stream.input_stream_t
    method as_memory_input_stream : Memory_input_stream.t
end

(* High-level class for MemoryInputStream *)
class memory_input_stream (obj : Memory_input_stream.t) : memory_input_stream_t = object (self)
  inherit GInput_stream.input_stream (obj :> Input_stream.t)

    method as_memory_input_stream = obj
end

let new_ () : memory_input_stream_t =
  new memory_input_stream (Memory_input_stream.new_ ())

