class type converter_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Pollable_output_stream.pollable_output_stream_t
  method get_converter : unit -> Converter.converter_t
  method as_converter_output_stream : Raw.Converter_output_stream.t
end

class converter_output_stream :
  Raw.Converter_output_stream.t ->
  converter_output_stream_t

val new_ :
  Output_stream.output_stream_t ->
  Converter.converter_t ->
  converter_output_stream_t
