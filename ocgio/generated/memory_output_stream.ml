class type memory_output_stream_t = object
  inherit GOutput_stream.output_stream_t
  inherit GPollable_output_stream.pollable_output_stream_t
  inherit GSeekable.seekable_t
  method get_data_size : unit -> Gsize.t
  method get_size : unit -> Gsize.t
  method steal_as_bytes : unit -> Glib_bytes.t
  method as_memory_output_stream : Memory_output_stream.t
end

(* High-level class for MemoryOutputStream *)
class memory_output_stream (obj : Memory_output_stream.t) :
  memory_output_stream_t =
  object (self)
    inherit GOutput_stream.output_stream (obj :> Output_stream.t)

    inherit
      GPollable_output_stream.pollable_output_stream
        (Pollable_output_stream.from_gobject obj)

    inherit GSeekable.seekable (Seekable.from_gobject obj)

    method get_data_size : unit -> Gsize.t =
      fun () -> Memory_output_stream.get_data_size obj

    method get_size : unit -> Gsize.t =
      fun () -> Memory_output_stream.get_size obj

    method steal_as_bytes : unit -> Glib_bytes.t =
      fun () -> Memory_output_stream.steal_as_bytes obj

    method as_memory_output_stream = obj
  end

let new_resizable () : memory_output_stream_t =
  new memory_output_stream (Memory_output_stream.new_resizable ())
