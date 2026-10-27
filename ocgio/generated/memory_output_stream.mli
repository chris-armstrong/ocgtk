(** [GMemoryOutputStream] is a class for using arbitrary memory chunks as output
    for GIO streaming output operations.

    As of GLib 2.34, [GMemoryOutputStream] trivially implements
    [Gio.PollableOutputStream]: it always polls as ready.

    Its methods, signals and properties are on
    {!class-type-memory_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Memory_output_stream}. *)

(** The methods, signals and properties of a [GMemoryOutputStream]. *)
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

class memory_output_stream :
  Raw.Memory_output_stream.t ->
  memory_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Memory_output_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GMemoryOutputStream], give one already wrapped. *)

val new_resizable : unit -> memory_output_stream_t
