class type converter_input_stream_t = object
    method get_converter : unit -> GConverter.converter_t
    method as_converter_input_stream : Converter_input_stream.t
end

class converter_input_stream : Converter_input_stream.t -> converter_input_stream_t

