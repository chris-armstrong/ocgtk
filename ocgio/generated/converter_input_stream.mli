(** Converter input stream implements [Gio.InputStream] and allows conversion of
    data of various types during reading.

    Its methods, signals and properties are on
    {!class-type-converter_input_stream_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Converter_input_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ConverterInputStream].}

    Inherits from:
    {{!Ocgio.Filter_input_stream.class-type-filter_input_stream_t}Ocgio.Filter_input_stream}

    Implements:
    - {{!Ocgio.Pollable_input_stream.class-type-pollable_input_stream_t}Ocgio.Pollable_input_stream}

    Converter input stream implements [Gio.InputStream] and allows conversion of
    data of various types during reading.

    As of GLib 2.34, [GConverterInputStream] implements
    [Gio.PollableInputStream]. *)
class type converter_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t

  (** {2:methods Methods} *)

  method get_converter : unit -> Converter.converter_t
  (** Gets the [GConverter] that is used by [converter_stream]. *)

  (** {2:conversions Conversions} *)

  method as_converter_input_stream : Raw.Converter_input_stream.t
end

class converter_input_stream :
  Raw.Converter_input_stream.t ->
  converter_input_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Converter_input_stream.t}. *)

(** {1:description Description}

    Converter input stream implements [Gio.InputStream] and allows conversion of
    data of various types during reading.

    As of GLib 2.34, [GConverterInputStream] implements
    [Gio.PollableInputStream]. *)

(** {1:constructors Constructors} *)

val new_ :
  Input_stream.input_stream_t ->
  Converter.converter_t ->
  converter_input_stream_t
(** Creates a new converter input stream for the [base_stream]. *)
