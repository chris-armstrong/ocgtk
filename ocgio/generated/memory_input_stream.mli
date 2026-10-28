(** [GMemoryInputStream] is a class for using arbitrary memory chunks as input
    for GIO streaming input operations.

    As of GLib 2.34, [GMemoryInputStream] implements [Gio.PollableInputStream].

    Its methods, signals and properties are on
    {!class-type-memory_input_stream_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Memory_input_stream}. *)

(** The methods, signals and properties of a [MemoryInputStream]. *)
class type memory_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t
  inherit Seekable.seekable_t

  method add_bytes : Glib_bytes.t -> unit
  (** Appends [bytes] to data that can be read from the input stream. *)

  method as_memory_input_stream : Raw.Memory_input_stream.t
end

class memory_input_stream : Raw.Memory_input_stream.t -> memory_input_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Memory_input_stream.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> memory_input_stream_t
(** Creates a new empty [GMemoryInputStream]. *)

val new_from_bytes : Glib_bytes.t -> memory_input_stream_t
(** Creates a new [GMemoryInputStream] with data from the given [bytes]. *)
