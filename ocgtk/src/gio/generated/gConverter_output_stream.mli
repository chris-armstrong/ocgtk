class type converter_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    inherit GPollable_output_stream.pollable_output_stream_t
    method get_converter : unit -> GConverter.converter_t
    method as_converter_output_stream : Converter_output_stream.t
end

class converter_output_stream : Converter_output_stream.t -> converter_output_stream_t

val new_ : GOutput_stream.output_stream_t -> GConverter.converter_t -> converter_output_stream_t
