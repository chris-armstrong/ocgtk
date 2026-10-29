(** [GMemoryInputStream] is a class for using arbitrary memory chunks as input
    for GIO streaming input operations.

    Its methods, signals and properties are on
    {!class-type-memory_input_stream_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Memory_input_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MemoryInputStream].}

    Inherits from:
    {{!Ocgio.Input_stream.class-type-input_stream_t}Ocgio.Input_stream}

    Implements:
    - {{!Ocgio.Pollable_input_stream.class-type-pollable_input_stream_t}Ocgio.Pollable_input_stream}
    - {{!Ocgio.Seekable.class-type-seekable_t}Ocgio.Seekable}

    [GMemoryInputStream] is a class for using arbitrary memory chunks as input
    for GIO streaming input operations.

    As of GLib 2.34, [GMemoryInputStream] implements
    {{!Ocgio.Pollable_input_stream.class-type-pollable_input_stream_t}[Gio.PollableInputStream]}.
*)
class type memory_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method add_bytes : Glib_bytes.t -> unit
  (** Appends [bytes] to data that can be read from the input stream. *)

  (** {2:conversions Conversions} *)

  method as_memory_input_stream : Raw.Memory_input_stream.t
end

class memory_input_stream : Raw.Memory_input_stream.t -> memory_input_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Memory_input_stream.t}. *)

(** {1:description Description}

    [GMemoryInputStream] is a class for using arbitrary memory chunks as input
    for GIO streaming input operations.

    As of GLib 2.34, [GMemoryInputStream] implements
    {{!Ocgio.Pollable_input_stream.class-type-pollable_input_stream_t}[Gio.PollableInputStream]}.
*)

(** {1:constructors Constructors} *)

val new_ : unit -> memory_input_stream_t
(** Creates a new empty [GMemoryInputStream]. *)

val new_from_bytes : Glib_bytes.t -> memory_input_stream_t
(** Creates a new [GMemoryInputStream] with data from the given [bytes]. *)
