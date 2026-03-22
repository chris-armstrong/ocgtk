class type converter_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    method get_converter : unit -> GConverter.converter_t
    method as_converter_input_stream : Converter_input_stream.t
end

class converter_input_stream : Converter_input_stream.t -> converter_input_stream_t

val new_ : GInput_stream.input_stream_t -> GConverter.converter_t -> converter_input_stream_t
