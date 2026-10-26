class type converter_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t
  method get_converter : unit -> Converter.converter_t
  method as_converter_input_stream : Raw.Converter_input_stream.t
end

class converter_input_stream :
  Raw.Converter_input_stream.t ->
  converter_input_stream_t

val new_ :
  Input_stream.input_stream_t ->
  Converter.converter_t ->
  converter_input_stream_t
