class type memory_output_stream_t = object
  inherit Output_stream.output_stream_t
  inherit Pollable_output_stream.pollable_output_stream_t
  inherit Seekable.seekable_t

  method get_data_size : unit -> Gsize.t
  (** Returns the number of bytes from the start up to including the last byte
      written in the stream that has not been truncated away. *)

  method get_size : unit -> Gsize.t
  (** Gets the size of the currently allocated data area (available from
      g_memory_output_stream_get_data()).

      You probably don't want to use this function on resizable streams. See
      g_memory_output_stream_get_data_size() instead. For resizable streams the
      size returned by this function is an implementation detail and may be
      change at any time in response to operations on the stream.

      If the stream is fixed-sized (ie: no realloc was passed to
      g_memory_output_stream_new()) then this is the maximum size of the stream
      and further writes will return [G_IO_ERROR_NO_SPACE].

      In any case, if you want the number of bytes currently written to the
      stream, use g_memory_output_stream_get_data_size(). *)

  method steal_as_bytes : unit -> Glib_bytes.t
  (** Returns data from the [ostream] as a [GBytes]. [ostream] must be closed
      before calling this function. *)

  method as_memory_output_stream : Raw.Memory_output_stream.t
end

(* High-level class for MemoryOutputStream *)
class memory_output_stream (obj : Raw.Memory_output_stream.t) :
  memory_output_stream_t =
  object (self)
    inherit Output_stream.output_stream (obj :> Raw.Output_stream.t)

    inherit
      Pollable_output_stream.pollable_output_stream
        (Raw.Pollable_output_stream.from_gobject obj)

    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method get_data_size : unit -> Gsize.t =
      fun () -> Raw.Memory_output_stream.get_data_size obj

    method get_size : unit -> Gsize.t =
      fun () -> Raw.Memory_output_stream.get_size obj

    method steal_as_bytes : unit -> Glib_bytes.t =
      fun () -> Raw.Memory_output_stream.steal_as_bytes obj

    method as_memory_output_stream = obj
  end

let new_resizable () : memory_output_stream_t =
  new memory_output_stream (Raw.Memory_output_stream.new_resizable ())
