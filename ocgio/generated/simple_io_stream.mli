(** [GSimpleIOStream] creates a
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} from an arbitrary
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}. This
    allows any pair of input and output streams to be used with
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} methods.

    Its methods, signals and properties are on {!class-type-simple_io_stream_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Simple_io_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SimpleIOStream].}

    Inherits from: {{!Ocgio.Io_stream.class-type-io_stream_t}Ocgio.Io_stream}

    [GSimpleIOStream] creates a
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} from an arbitrary
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}. This
    allows any pair of input and output streams to be used with
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} methods.

    This is useful when you obtained a
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and a
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]} by
    other means, for instance creating them with platform specific methods as
    [g_unix_input_stream_new()] (from [gio-unix-2.0.pc] / [GioUnix-2.0]), and
    you want to take advantage of the methods provided by
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]}. *)
class type simple_io_stream_t = object
  inherit Io_stream.io_stream_t

  (** {2:conversions Conversions} *)

  method as_simple_io_stream : Raw.Simple_io_stream.t
end

class simple_io_stream : Raw.Simple_io_stream.t -> simple_io_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Simple_io_stream.t}. *)

(** {1:description Description}

    [GSimpleIOStream] creates a
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} from an arbitrary
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]}. This
    allows any pair of input and output streams to be used with
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]} methods.

    This is useful when you obtained a
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} and a
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]} by
    other means, for instance creating them with platform specific methods as
    [g_unix_input_stream_new()] (from [gio-unix-2.0.pc] / [GioUnix-2.0]), and
    you want to take advantage of the methods provided by
    {{!Ocgio.Io_stream.class-type-io_stream_t}[Gio.IOStream]}. *)

(** {1:constructors Constructors} *)

val new_ :
  Input_stream.input_stream_t ->
  Output_stream.output_stream_t ->
  simple_io_stream_t
(** Creates a new [GSimpleIOStream] wrapping [input_stream] and [output_stream].
    See also [GIOStream]. *)
