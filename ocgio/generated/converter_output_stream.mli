(** Converter output stream implements
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]} and
    allows conversion of data of various types during reading.

    Its methods, signals and properties are on
    {!class-type-converter_output_stream_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Converter_output_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ConverterOutputStream].}

    Inherits from:
    {{!Ocgio.Filter_output_stream.class-type-filter_output_stream_t}Ocgio.Filter_output_stream}

    Implements:
    - {{!Ocgio.Pollable_output_stream.class-type-pollable_output_stream_t}Ocgio.Pollable_output_stream}

    Converter output stream implements
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]} and
    allows conversion of data of various types during reading.

    As of GLib 2.34, [GConverterOutputStream] implements
    {{!Ocgio.Pollable_output_stream.class-type-pollable_output_stream_t}[Gio.PollableOutputStream]}.
*)
class type converter_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Pollable_output_stream.pollable_output_stream_t

  (** {2:methods Methods} *)

  method get_converter : unit -> Converter.converter_t
  (** Gets the [GConverter] that is used by [converter_stream]. *)

  (** {2:conversions Conversions} *)

  method as_converter_output_stream : Raw.Converter_output_stream.t
end

class converter_output_stream :
  Raw.Converter_output_stream.t ->
  converter_output_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Converter_output_stream.t}. *)

(** {1:description Description}

    Converter output stream implements
    {{!Ocgio.Output_stream.class-type-output_stream_t}[Gio.OutputStream]} and
    allows conversion of data of various types during reading.

    As of GLib 2.34, [GConverterOutputStream] implements
    {{!Ocgio.Pollable_output_stream.class-type-pollable_output_stream_t}[Gio.PollableOutputStream]}.
*)

(** {1:constructors Constructors} *)

val new_ :
  Output_stream.output_stream_t ->
  Converter.converter_t ->
  converter_output_stream_t
(** Creates a new converter output stream for the [base_stream]. *)
