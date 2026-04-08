class type memory_input_stream_t = object
    inherit GInput_stream.input_stream_t
    method add_bytes : Glib_bytes.t -> unit
    method as_memory_input_stream : Memory_input_stream.t
end

(* High-level class for MemoryInputStream *)
class memory_input_stream (obj : Memory_input_stream.t) : memory_input_stream_t = object (self)
  inherit GInput_stream.input_stream (obj :> Input_stream.t)

  method add_bytes : Glib_bytes.t -> unit =
    fun bytes ->
      (Memory_input_stream.add_bytes obj bytes)

    method as_memory_input_stream = obj
end

let new_ () : memory_input_stream_t =
  new memory_input_stream (Memory_input_stream.new_ ())

let new_from_bytes (bytes : Glib_bytes.t) : memory_input_stream_t =
  let obj_ = Memory_input_stream.new_from_bytes bytes in
  new memory_input_stream obj_

