(** Converter output stream implements [Gio.OutputStream] and allows conversion
    of data of various types during reading.

    As of GLib 2.34, [GConverterOutputStream] implements
    [Gio.PollableOutputStream].

    Its methods, signals and properties are on
    {!class-type-converter_output_stream_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Converter_output_stream}. *)

(** The methods, signals and properties of a [GConverterOutputStream]. *)
class type converter_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Pollable_output_stream.pollable_output_stream_t

  method get_converter : unit -> Converter.converter_t
  (** Gets the [GConverter] that is used by [converter_stream]. *)

  method as_converter_output_stream : Raw.Converter_output_stream.t
end

class converter_output_stream :
  Raw.Converter_output_stream.t ->
  converter_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Converter_output_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GConverterOutputStream], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ :
  Output_stream.output_stream_t ->
  Converter.converter_t ->
  converter_output_stream_t
(** Creates a new converter output stream for the [base_stream]. *)
