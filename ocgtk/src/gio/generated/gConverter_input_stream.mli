class converter_input_stream : Converter_input_stream.t ->
  object
    method get_converter : unit -> GConverter.converter
    method as_converter_input_stream : Converter_input_stream.t
  end

