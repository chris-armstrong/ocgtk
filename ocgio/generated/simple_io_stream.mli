(** [GSimpleIOStream] creates a [Gio.IOStream] from an arbitrary
    [Gio.InputStream] and [Gio.OutputStream]. This allows any pair of input and
    output streams to be used with [Gio.IOStream] methods.

    This is useful when you obtained a [Gio.InputStream] and a
    [Gio.OutputStream] by other means, for instance creating them with platform
    specific methods as [g_unix_input_stream_new()] (from [gio-unix-2.0.pc] /
    [GioUnix-2.0]), and you want to take advantage of the methods provided by
    [Gio.IOStream].

    Its methods, signals and properties are on {!class-type-simple_io_stream_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Simple_io_stream}. *)

(** The methods, signals and properties of a [GSimpleIOStream]. *)
class type simple_io_stream_t = object
  inherit Io_stream.io_stream_t
  method as_simple_io_stream : Raw.Simple_io_stream.t
end

class simple_io_stream : Raw.Simple_io_stream.t -> simple_io_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Simple_io_stream.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSimpleIOStream], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  Input_stream.input_stream_t ->
  Output_stream.output_stream_t ->
  simple_io_stream_t
(** Creates a new [GSimpleIOStream] wrapping [input_stream] and [output_stream].
    See also [GIOStream]. *)
