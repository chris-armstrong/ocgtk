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
  method get_size : unit -> Gsize.t
  method steal_as_bytes : unit -> Glib_bytes.t
  method as_memory_output_stream : Raw.Memory_output_stream.t
end

class memory_output_stream :
  Raw.Memory_output_stream.t ->
  memory_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Memory_output_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GMemoryOutputStream], give one already wrapped. *)

val new_resizable : unit -> memory_output_stream_t
