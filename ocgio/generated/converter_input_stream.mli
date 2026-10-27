(** Converter input stream implements [Gio.InputStream] and allows conversion of
    data of various types during reading.

    As of GLib 2.34, [GConverterInputStream] implements
    [Gio.PollableInputStream].

    Its methods, signals and properties are on
    {!class-type-converter_input_stream_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Converter_input_stream}. *)

(** The methods, signals and properties of a [GConverterInputStream]. *)
class type converter_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t

  method get_converter : unit -> Converter.converter_t
  (** Gets the [GConverter] that is used by [converter_stream]. *)

  method as_converter_input_stream : Raw.Converter_input_stream.t
end

class converter_input_stream :
  Raw.Converter_input_stream.t ->
  converter_input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Converter_input_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GConverterInputStream], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  Input_stream.input_stream_t ->
  Converter.converter_t ->
  converter_input_stream_t
(** Creates a new converter input stream for the [base_stream]. *)
