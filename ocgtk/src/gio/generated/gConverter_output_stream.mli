class type converter_output_stream_t = object
    method get_converter : unit -> GConverter.converter_t
    method as_converter_output_stream : Converter_output_stream.t
end

class converter_output_stream : Converter_output_stream.t -> converter_output_stream_t

