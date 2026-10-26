class type memory_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t
  inherit Seekable.seekable_t
  method add_bytes : Glib_bytes.t -> unit
  method as_memory_input_stream : Raw.Memory_input_stream.t
end

(* High-level class for MemoryInputStream *)
class memory_input_stream (obj : Raw.Memory_input_stream.t) :
  memory_input_stream_t =
  object (self)
    inherit Input_stream.input_stream (obj :> Raw.Input_stream.t)

    inherit
      Pollable_input_stream.pollable_input_stream
        (Raw.Pollable_input_stream.from_gobject obj)

    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method add_bytes : Glib_bytes.t -> unit =
      fun bytes -> Raw.Memory_input_stream.add_bytes obj bytes

    method as_memory_input_stream = obj
  end

let new_ () : memory_input_stream_t =
  new memory_input_stream (Raw.Memory_input_stream.new_ ())

let new_from_bytes (bytes : Glib_bytes.t) : memory_input_stream_t =
  let obj_ = Raw.Memory_input_stream.new_from_bytes bytes in
  new memory_input_stream obj_
